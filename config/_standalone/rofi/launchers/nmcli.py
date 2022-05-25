#!/usr/bin/env python3
# encoding:utf8
"""NetworkManager command line dmenu script.

To add new connections or enable/disable networking requires policykit
permissions setup per:
https://wiki.archlinux.org/index.php/NetworkManager#Set_up_PolicyKit_permissions

OR running the script as root

Add dmenu formatting options and default terminal if desired to
~/.config/networkmanager-dmenu/config.ini

"""
import gi
import itertools
import locale
import os
import shlex
import sys
from os.path import expanduser
from subprocess import Popen, PIPE

gi.require_version('NM', '1.0')
from gi.repository import NM

ENV = os.environ.copy()
ENV['LC_ALL'] = 'C'
ENC = "utf-8"

client = NM.Client.new(None)
conns = client.get_connections()


def run_rofi(alts, prompt="Settings", strip=True, force_alts=False, max_lines=20):
    """TODO: Docstring for run_rofi.
    :returns: Selected option or entered string
    """
    lines = max(min(max_lines, len(alts)), 1);

    rofi = Popen(["rofi", "-i", "-dmenu", "-l", str(lines), "-p", prompt + ": "], stdout=PIPE, stdin=PIPE)
    selected = rofi.communicate("\n".join(alts).encode("utf-8"))[0].decode("utf-8")

    if strip:
        selected = selected.strip();
    
    return selected;


def choose_adapter(client):
    """If there is more than one wifi adapter installed, ask which one to use

    """
    devices = client.get_devices()
    devices = [i for i in devices if i.get_device_type() == NM.DeviceType.WIFI]
    if len(devices) == 0:
        return None
    elif len(devices) == 1:
        return devices[0]

    sel = run_rofi([d.get_iface() for d in devices], "Choose Adapter")
    
    if not sel:
        sys.exit()

    devices = [i for i in devices if i.get_iface() == sel]
    assert len(devices) == 1
    return devices[0]


def create_other_actions(client):
    """Return list of other actions that can be taken

    """
    networking_enabled = client.networking_get_enabled()
    networking_action = "Disable" if networking_enabled else "Enable"
    wifi_enabled = client.wireless_get_enabled()
    wifi_action = "Disable" if wifi_enabled else "Enable"
    return [Action("{} Wifi".format(wifi_action), toggle_wifi,
                   not wifi_enabled),
            Action("{} Networking".format(networking_action),
                   toggle_networking, not networking_enabled)]


def ssid_to_utf8(ap):
    ssid = ap.get_ssid()
    if not ssid:
        return ""
    return NM.utils_ssid_to_utf8(ssid.get_data())


def ap_security(ap):
    flags = ap.get_flags()
    wpa_flags = ap.get_wpa_flags()
    rsn_flags = ap.get_rsn_flags()
    sec_str = ""
    if ((flags & getattr(NM, '80211ApFlags').PRIVACY) and
            (wpa_flags == 0) and (rsn_flags == 0)):
        sec_str += " WEP"
    if wpa_flags != 0:
        sec_str += " WPA1"
    if rsn_flags != 0:
        sec_str += " WPA2"
    if ((wpa_flags & getattr(NM, '80211ApSecurityFlags').KEY_MGMT_802_1X) or
            (rsn_flags & getattr(NM, '80211ApSecurityFlags').KEY_MGMT_802_1X)):
        sec_str += " 802.1X"

    # If there is no security use "--"
    if sec_str == "":
        sec_str = "--"
    return sec_str.lstrip()


class Action(object):
    def __init__(self,
                 name,
                 f,
                 args=None,
                 ):
        self.name = name
        self.f = f
        if args is None:
            self.args = None
        elif isinstance(args, list):
            self.args = args
        else:
            self.args = [args]

    def __str__(self):
        return self.name

    def __call__(self):
        if self.args is None:
            self.f()
        else:
            self.f(*self.args)


def process_ap(ap, is_active):
    if is_active:
        client.deactivate_connection_async(ap)
    else:
        con = ap.filter_connections(conns)
        if len(con) > 1:
            raise ValueError("There are multiple connections possible")

        if len(con) == 1:
            client.activate_connection_async(con[0])
        else:
            if ap_security(ap) != "--":
                password = get_passphrase()
            else:
                password = ""
            set_new_connection(ssid_to_utf8(ap), password)


def process_vpngsm(con, activate):
    if activate:
        client.activate_connection_async(con)
    else:
        client.deactivate_connection_async(con)


def create_ap_actions(aps, active_ap, active_connection):
    active_ap_bssid = active_ap.get_bssid() if active_ap is not None else ""

    names = [ssid_to_utf8(ap) for ap in aps]
    max_len_name = max([len(name) for name in names]) if names else 0
    secs = [ap_security(ap) for ap in aps]
    max_len_sec = max([len(sec) for sec in secs]) if secs else 0

    ap_actions = []

    for ap, name, sec in zip(aps, names, secs):
        bars = NM.utils_wifi_strength_bars(ap.get_strength())
        is_active = ap.get_bssid() == active_ap_bssid
        active_flag = "**" if is_active else "  "
        action_name = "{} {:<{}s}  {:<{}s}  {}".format(active_flag, name,
                                                       max_len_name, sec,
                                                       max_len_sec, bars)
        if is_active:
            ap_actions.append(Action(action_name, process_ap,
                                     [active_connection, True]))
        else:
            ap_actions.append(Action(action_name, process_ap, [ap, False]))
    return ap_actions


def create_vpn_actions(vpns, active):
    active_vpns = [i for i in active if i.get_vpn()]
    return _create_vpngsm_actions(vpns, active_vpns, "VPN")


# TODO: Test this
def create_gsm_actions(gsms, active):
    active_gsms = [i for i in active if
                   i.get_connection().is_type(NM.SETTING_GSM_SETTING_NAME)]
    return _create_vpngsm_actions(gsms, active_gsms, "GSM")


def _create_vpngsm_actions(cons, active_cons, label):
    active_con_ids = [a.get_id() for a in active_cons]
    actions = []
    for con in cons:
        is_active = con.get_id() in active_con_ids
        active_flag = "**" if is_active else "  "
        action_name = "{} {}:{}".format(active_flag, con.get_id(), label)
        if is_active:
            active_connection = [a for a in active_cons
                                 if a.get_id() == con.get_id()]
            if len(active_connection) != 1:
                raise ValueError("Multiple active connections match"
                                 " the connection: %s" % con.get_id())
            active_connection = active_connection[0]

            actions.append(Action(action_name, process_vpngsm,
                                  [active_connection, False]))
        else:
            actions.append(Action(action_name, process_vpngsm,
                                  [con, True]))
    return actions


def get_selection(client, aps, vpns, gsms, others):
    """Combine the arg lists and send to dmenu for selection.
    Also executes the associated action.

    Args: args - aps: list of Actions
                 vpns: list of Actions
                 gsms: list of Actions
                 others: list of Actions
    """
    formated_aps = [str(ap) for ap in aps]
    formated_vpns = [str(vpn) for vpn in vpns]
    formated_gsms = [str(gsm) for gsm in gsms]
    formated_others = [str(other) for other in others]

    inp = []
    if formated_aps:
        inp += formated_aps + [""]
    if vpns:
        inp += formated_vpns + [""]
    if gsms:
        inp += formated_gsms + [""]
    inp += formated_others


    inp_bytes = "\n".join([str(i) for i in inp]) 
         
    inp_bytes = inp_bytes.encode(ENC)
    sel = run_rofi([str(i) for i in inp], strip=False)

    if not sel.strip():
        sys.exit()

    action = [i for i in aps + vpns + gsms + others
              if str(i) == sel.rstrip("\n")]
    assert len(action) == 1, "Selection was ambiguous: {}, {}".format(str(sel), str(action))
    return action[0]


def toggle_networking(enable):
    """Enable/disable networking

    Args: enable - boolean

    """
    client.networking_set_enabled(enable)


def toggle_wifi(enable):
    """Enable/disable Wifi

    Args: enable - boolean

    """
    client.wireless_set_enabled(enable)


def get_passphrase():
    """Get a password

    Returns: string

    """
    return run_rofi([], prompt="Passphrase")


def set_new_connection(ssid, pw):
    """Setup a new NetworkManager connection

    Args: ssid - string
          pw - string

    """
    pw = str(pw).strip()
    new_conn = ["nmcli", "device", "wifi", "connect", ssid, "password", pw]
    res = Popen(new_conn, stdout=PIPE, env=ENV).communicate()
    # Delete connection if it fails somehow.
    # With nmcli 0.9.10, you occasionally get an error message:
    # "Error: Failed to add/activate new connection: Unknown error", which
    # doesn't always mean the connection failed, so test for 'activated' or
    # 'activating' in the connection status as well
    # Delete connections with errors
    if "activated" not in res[0].decode(ENC):
        delete = ["nmcli", "connection", "delete", ssid]
        Popen(delete, stdout=PIPE).communicate()


def run():
    active = client.get_active_connections()

    adapter = choose_adapter(client)

    if adapter:
        aps = sorted(adapter.get_access_points(),
                     key=lambda a: a.get_strength(), reverse=True)
        active_ap = adapter.get_active_access_point()
        active_ap_con = [i for i in active if
                         i.get_connection_type() ==
                         NM.SETTING_WIRELESS_SETTING_NAME]
        if len(active_ap_con) > 1:
            raise ValueError("Multiple connections match"
                             " the wireless connection")
        active_ap_con = active_ap_con[0] if active_ap_con else None
        ap_actions = create_ap_actions(aps, active_ap, active_ap_con)
    else:
        ap_actions = []

    vpns = [i for i in conns if i.is_type(NM.SETTING_VPN_SETTING_NAME)]
    gsms = [i for i in conns if i.is_type(NM.SETTING_GSM_SETTING_NAME)]

    vpn_actions = create_vpn_actions(vpns, active)
    gsm_actions = create_gsm_actions(gsms, active)
    other_actions = create_other_actions(client)

    sel = get_selection(client, ap_actions, vpn_actions,
                        gsm_actions, other_actions)
    sel()


if __name__ == '__main__':
    run()

# vim: set et ts=4 sw=4 :
