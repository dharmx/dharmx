#!/usr/bin/env bash

# the display system that is written in Java and coincidentally(?) it is the
# only one that is whitelisted by Java apps
# If you don't use Java then comment/remove it
wmname LG3D &
# wmname compiz &

# set your wallpaper
feh --bg-scale "$XDG_PICTURES_DIR/wallpapers/nord/ign-flower-real-nord.png" &

# update the font cache
# fc-cache -fr &> /dev/null &

xsetroot -cursor_name left_ptr &

# start playerctl daemon
# playerctld daemon &

# start polybar
polybar -q -c "$XDG_CONFIG_HOME"/polybar/configs/antartica/nordic.ini main &

# start dunst daemon
# dunst &

# start mpd daemon
# mpd &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
# nm-applet &

# Start blueman applet for bluetooth
# blueman-applet &

# Launch live wallpaper app
# komorebi &
exit 0
