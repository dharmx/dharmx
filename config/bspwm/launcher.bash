#!/usr/bin/env bash

sleep 2

# wmname LG3D &
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

wallpapers=(
"ign-unsplash-flower-7-dark-res"
"ign-unsplash-flower-3-dark"
"ign-unsplash-flower-8-dark-res"
"ign-unsplash-lotus-dark-res"
"ign-unsplash-flower-5-dark-res"
"ign-pedro-saraiva-flower-dark"
"ign-joey-flower-dark"
"ign-flower-real-nord"
"ign-unsplash-flower-9-dark-res"
"ign-jinen-shah-unsplash-dark"
"ign-bady-abbas-unsplash-dark"
"ign-xuan-nguyen-unsplash-dark"
"ign-xuan-nguyen-Gg-unsplash-dark"
)

choice=${wallpapers["$((1 + RANDOM % 12))"]}
feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/nord/$choice.jpg"

unset wallpapers
unset choice

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

# start system tray 
stalonetray &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
# nm-applet &

# Start blueman applet for bluetooth
# blueman-applet &

# Launch live wallpaper app
# komorebi &
exit 0

# vim:number:nowrap
