#!/usr/bin/env zsh

typeset -gx XDG_CURRENT_DESKTOP="bspwm"
xrdb -I "$XDG_CONFIG_HOME/Xresources" "$XDG_CONFIG_HOME/Xresources/config.x" &
xmodmap "$XDG_CONFIG_HOME/xmodmap/config"

source "$XDG_CONFIG_HOME/bspwm/default.zsh"
source "$XDG_CONFIG_HOME/bspwm/rules.zsh"
source "$XDG_CONFIG_HOME/bspwm/launch.zsh"

# LG3D or compiz for Java
wmname bspwm &

# set root cursor
xsetroot -cursor_name left_ptr &

# restore wallpaper and play a cringe login sound
[ -x "$HOME/.fehbg" ] && source "$HOME/.fehbg" || feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/centered/wp4047981-minimalism-wallpapers.jpg" &
mpv --keep-open=no --really-quiet "/usr/share/sounds/Smooth/stereo/desktop-login.oga"

for scrip in "$XDG_CONFIG_HOME/bspwm/hooks/"*
do
  [[ "$scrip" != *".skip" ]] && {
    pgrep --full "$scrip" | xargs kill -9 2>/dev/null
    eval "$scrip" &
  }
done

# vim:ft=zsh:number:nowrap
