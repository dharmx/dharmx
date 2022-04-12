#!/usr/bin/env bash

skull="Skull Fetch"
waifu="Waifu Fetch"
rip="RIP Fetch"
cold="Cold Fetch"
food="Food Fetch"

CONFIG_PART="$XDG_CONFIG_HOME/neofetch/configs"
CHOICE="$(echo -e "$skull\n$waifu\n$rip\n$cold\n$food" | rofi -dmenu -theme "$XDG_CONFIG_HOME/rofi/configs/neofetch.rasi")"

bspc node focused -t floating
case "$CHOICE" in
  "$skull")
    neofetch --config "$CONFIG_PART/flowerskull.conf" --source "$XDG_CONFIG_HOME/neofetch/images/polar-skull.png"
    ;;
  "$waifu")
    "$XDG_CONFIG_HOME/neofetch/launch.bash" --waifu
    ;;
  "$rip")
    neofetch --config "$CONFIG_PART/rip.conf" --source "$XDG_CONFIG_HOME/neofetch/images/riparch.png"
    ;;
  "$cold")
    neofetch --config "$CONFIG_PART/waifu.conf" --source "$XDG_CONFIG_HOME/neofetch/images/polararchdimmed.png"
    ;;
  "$food")
    neofetch --config "$CONFIG_PART/food.conf" --source "$XDG_CONFIG_HOME/neofetch/images/onigiri.png"
    ;;
  *)
    echo "ERROR"
    ;;
esac
printf '\x1b]12;#2e3440\x1b\\'
read -r

# vim:ft=bash:nowrap
