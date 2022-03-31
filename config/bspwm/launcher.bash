#!/usr/bin/env bash

sleep 2

# wmname LG3D &
# wmname compiz &

feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/abstract/wallhaven-39lvjd.png"

#
#
# update the font cache
# fc-cache -fr &> /dev/null &

xsetroot -cursor_name left_ptr &

# start playerctl daemon
# playerctld daemon &

# start polybar
eval "$XDG_CONFIG_HOME/polybar/configs/evilnord/launch.bash" &

# start dunst daemon
dunst &

# start mpd-discord-rpc
# mpd-discord-rpc &

# start system tray
stalonetray &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
# nm-applet &

# Start blueman applet for bluetooth
# blueman-applet &

exit 0

# vim:number:nowrap
