#!/usr/bin/env bash

CONNECTED="$XDG_CONFIG_HOME/tint2/icons/power_white_48dp.svg"
DISCONNECTED="$XDG_CONFIG_HOME/tint2/icons/power_off_white_48dp.svg"

CURRENT_STATUS="$(cat /sys/class/power_supply/ADP0/online)"

notify_green() {
  notify-send -h "string:bgcolor:#a3be8c"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$CONNECTED"                \
            "$1"                                             \
            "$2"
}

notify_red() {
  notify-send -h "string:bgcolor:#bf616a"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$DISCONNECTED"             \
            "$1"                                             \
            "$2"
}


dunstctl close
if [[ "$CURRENT_STATUS" -eq 1 ]]; then
  notify_green "AC" "Plugged"
else
  notify_red "AC" "Unplugged"
fi
