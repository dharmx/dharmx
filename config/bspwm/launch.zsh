sleep 2

# wmname LG3D/compiz
wmname bspwm

if [ ! -x "$HOME/.fehbg" ]; then
  feh --bg-fill "$XDG_PICTURES_DIR/wallpapers/monochrome/wallhaven-x8ye3z.jpg"
else
  source "$HOME/.fehbg"
fi

xsetroot -cursor_name left_ptr

# start polybar
eval "$XDG_CONFIG_HOME/polybar/launch.zsh"

# start system tray
# stalonetray &

# NetworkManager is the most popular way to manage wireless networks on Linux,
# and nm-applet is a desktop environment-independent system tray GUI for it.
# nm-applet &

# Start blueman applet for bluetooth
# blueman-applet &

mpv --keep-open=no --really-quiet "$HOME/.sounds/Smooth/stereo/system-ready.ogg" &

# vim:ft=zsh
