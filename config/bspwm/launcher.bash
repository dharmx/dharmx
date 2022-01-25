#!/usr/bin/env bash

# the display system that is written in Java and coincidentally(?) it is the
# only one that is whitelisted by Java apps
# If you don't use Java then comment/remove it
wmname LG3D &
# wmname compiz &

# set your wallpaper

#case "$(date +%A)" in
#"Monday") feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/ign-joey-flower-dark.jpg" ;;
#"Tuesday") feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/ign-unsplash-flower-3-dark.jpg" ;;
#"Wednesday") feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/ign-unsplash-flower-8-dark-res.jpg" ;;
#"Thursday") feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/ign-unsplash-lotus-dark-res.jpg" ;;
#"Friday") feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/ign-joey-flower-dark.jpg" ;;
#"Saturday") feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/ign-unsplash-flower-5-dark-res.jpg" ;;
#"Sunday") feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/ign-flower-real-nord.png" ;;
#*) ;;
#esac

feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/$(python -c 'print(__import__("random").choice(["ign-unsplash-flower-7-dark-res", "ign-unsplash-flower-3-dark", "ign-unsplash-flower-8-dark-res", "ign-unsplash-lotus-dark-res", "ign-unsplash-flower-5-dark-res", "ign-pedro-saraiva-flower-dark", "ign-joey-flower-dark", "ign-flower-real-nord", "ign-unsplash-flower-9-dark-res", "ign-unsplash-flower-4-dark"]))').jpg"

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

# start mpd daemon
mpd &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
# nm-applet &

# Start blueman applet for bluetooth
# blueman-applet &

# Launch live wallpaper app
# komorebi &
exit 0

# vim:number:nowrap
