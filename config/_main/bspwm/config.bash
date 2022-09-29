#!/usr/bin/env bash
# shellcheck disable=1091

export XDG_SESSION_TYPE="x11"
export XDG_CURRENT_DESKTOP="bspwm"

xmodmap "$XDG_CONFIG_HOME/xmodmap/config"
xrdb -I "$XDG_CONFIG_HOME/Xresources" "$XDG_CONFIG_HOME/Xresources/config.x"

source "$XDG_CONFIG_HOME/bspwm/rules.bash"
source "$XDG_CONFIG_HOME/bspwm/default.bash"
source "$XDG_CONFIG_HOME/bspwm/launch.bash"

# set root cursor
xsetroot -cursor_name left_ptr
xset mouse 0 0

# restore wallpaper and play a cringe login sound
[ -x "$HOME/.fehbg" ] || feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/centered/wp4047981-minimalism-wallpapers.jpg" && source "$HOME/.fehbg"
# mpv --keep-open=no --really-quiet "/usr/share/sounds/Smooth/stereo/desktop-login.oga"

# all floating in desktop 3
# sleep 5 && unify pseudo_tiled 3 &

# LG3D or compiz for Java
# wmname LG3D &

for scrip in "$XDG_CONFIG_HOME/bspwm/hooks/"*; do
  [[ "$scrip" != *".skip" ]] && {
    pgrep --full "$scrip" | xargs kill -9 2> /dev/null
    eval "$scrip &>/dev/null &"
  }
done

# vim:ft=sh:number:nowrap
