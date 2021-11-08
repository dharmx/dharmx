#!/bin/sh

# see https://unix.stackexchange.com/a/295652/332452
# shellcheck source=/dev/null
. /etc/X11/xinit/xinitrc.d/50-systemd-user.sh

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval "$(/usr/bin/gnome-keyring-daemon --start)"
export SSH_AUTH_SOCK

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache

export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export XDG_DOCUMENTS_DIR=$HOME/Documents 
export XDG_DOWNLOAD_DIR=$HOME/Downloads  
export XDG_MUSIC_DIR=$HOME/Music
export XDG_PICTURES_DIR=$HOME/Pictures
export XDG_TEMPLATES_DIR=$HOME/Templates 
export XDG_VIDEOS_DIR=$HOME/Videos

export XDG_CONFIG_DIRS=/etc/xdg
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_DATA_DIRS=/usr/local/share:/usr/share
# export XDG_PUBLICSHARE_DIR=

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings
exec bspwm 
