#!/bin/sh

# zenity --password
rofi -dmenu             \
  -password             \
  -i                    \
  -no-fixed-num-lines   \
  -p "Password: "       \
  -theme "$XDG_CONFIG_HOME/rofi/askpass.rasi"

# vim:filetype=sh
