#!/usr/bin/env bash

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

if [ ! "$PWD" = "$HOME" ]; then
  pushd "$HOME"
  export XDG_CURRENT_DESKTOP="${1:-bspwm}"
  popd
else
  export XDG_CURRENT_DESKTOP="${1:-bspwm}"
fi

exec "$XDG_CURRENT_DESKTOP"
