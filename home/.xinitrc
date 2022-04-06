#!/usr/bin/env zsh

# SEE: https://unix.stackexchange.com/a/295652/332452
# shellcheck source=/dev/null
source "/etc/X11/xinit/xinitrc.d/50-systemd-user.sh"

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval "$(/usr/bin/gnome-keyring-daemon --start)"
export SSH_AUTH_SOCK

# SEE: https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$XDG_DATA_HOME/keyrings"

xrdb -I$XDG_CONFIG_HOME/Xresources $XDG_CONFIG_HOME/Xresources/config.Xresources

exec bspwm

# vim:ft=zsh
