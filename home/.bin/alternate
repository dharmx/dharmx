#!/usr/bin/env bash

while :; do
  code="$(xal | tr -d '\n')"
  read -r choice < <(echo -e "Yes\nNo" | rofi -dmenu -i -no-fixed-num-lines -p "Copy $code?" -theme ~/.config/rofi/prompt.rasi)
  [[ "$choice" == "Yes" ]] && echo -en "$code" | xclip -selection c
done
