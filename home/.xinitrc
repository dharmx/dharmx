#!/usr/bin/env bash

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
export XDG_RUNTIME_DIR="/run/user/$(id -u)"
export XDG_SESSION_TYPE="x11"

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

export XCURSOR_SIZE=32

userresources=$XDG_CONFIG_HOME/Xresources/config.x
usermodmap=$XDG_CONFIG_HOME/xmodmap/config
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

if [ -f $sysresources ]; then
  xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
  xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
  xrdb -I "$XDG_CONFIG_HOME/Xresources" -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

xset b off
xsetroot -cursor_name left_ptr
xset mouse 0 0

# SEE: https://unix.stackexchange.com/a/295652/332452
# shellcheck source=/dev/null
if [ -d "$XDG_CONFIG_HOME"/xinitrc.d ]; then
  for file in "$XDG_CONFIG_HOME"/xinitrc.d/?*.sh ; do
    [ -x "$file" ] && source "$file"
  done
  unset file
fi

# SEE: https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval "$(/usr/bin/gnome-keyring-daemon --start)"
export SSH_AUTH_SOCK

# SEE: https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$XDG_DATA_HOME/keyrings"

function init_session() {
  export XDG_CURRENT_DESKTOP="bspwm"
  exec bspwm
}

if [ ! "$PWD" = "$HOME" ]; then
  pushd "$HOME"
  init_session
  popd
else
  init_session
fi

# vim:ft=sh
