#!/usr/bin/env bash

function init_session() {
  xset b off

  # SEE: https://unix.stackexchange.com/a/295652/332452
  # shellcheck source=/dev/null
  source "/etc/X11/xinit/xinitrc.d/50-systemd-user.sh"

  # see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
  eval "$(/usr/bin/gnome-keyring-daemon --start)"
  export SSH_AUTH_SOCK

  # SEE: https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
  mkdir -p "$XDG_DATA_HOME/keyrings"

  systemctl --user import-environment DISPLAY XAUTHORITY
  if which dbus-update-activation-environment >/dev/null 2>&1; then
    dbus-update-activation-environment DISPLAY XAUTHORITY
  fi

  exec bspwm -c "$XDG_CONFIG_HOME/bspwm/config.bash"
}

if [ ! "$PWD" = "$HOME" ]
then
  pushd "$HOME"
  init_session
  popd
else
  init_session
fi

# vim:ft=sh
