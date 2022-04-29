#!/usr/bin/env bash

mpv --keep-open=no --really-quiet "/usr/share/sounds/Smooth/stereo/dialog-question.oga" &
echo -e "Yup\nNope" | rofi -dmenu -theme "$XDG_CONFIG_HOME/rofi/configs/prompt.rasi"
 
