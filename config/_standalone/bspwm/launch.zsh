#!/usr/bin/env zsh
sleep 2

# wmname LG3D/compiz
wmname bspwm

if [ ! -x "$HOME/.fehbg" ]; then
  feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/monochrome/wallhaven-x8ye3z.jpg"
else 
  source "$HOME/.fehbg" 
fi

xsetroot -cursor_name left_ptr

# start eww
bspc subscribe node_state | while read -r _ _ _ _ state flag; do
    [ $ $state = fullscreen ] && continue
    [ $flag = on ] && xdo lower -N eww-vertigo || xdo raise -N eww-vertigo
done &
eww open vertigo &

# start system tray
stalonetray &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
# nm-applet &

# Start blueman applet for bluetooth
# blueman-applet &

# Start dunst
dunst & disown

# Play cringe login sound
mpv --keep-open=no --really-quiet "/usr/share/sounds/Smooth/stereo/desktop-login.oga"

# vim:ft=zsh
