#!/usr/bin/env bash

mpv --keep-open=no --really-quiet "$HOME/.sounds/Smooth/stereo/count-down.oga" &
echo -e "Yup\nNope" | rofi -dmenu -theme "$XDG_CONFIG_HOME/rofi/configs/prompt.rasi"
 
