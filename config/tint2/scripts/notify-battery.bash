#!/usr/bin/env bash

ALERT="$XDG_CONFIG_HOME/tint2/icons/battery_alert_white_64dp.svg"
FULL="$XDG_CONFIG_HOME/tint2/icons/battery-full.svg"
HALF="$XDG_CONFIG_HOME/tint2/icons/battery-half.svg"
CHARGING="$XDG_CONFIG_HOME/tint2/icons/battery-charging.svg"

CURRENT_LEVEL="$(cat /sys/class/power_supply/BAT0/capacity)"
CURRENT_STATUS="$(cat /sys/class/power_supply/BAT0/status)"

notify_green() {
  notify-send -h "string:bgcolor:#a3be8c"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$CHARGING"                 \
            "$1"                                             \
            "$2"
}

notify_red() {
  notify-send -h "string:bgcolor:#bf616a"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$ALERT"                    \
            "$1"                                             \
            "$2"
}

notify_redv2() {
  notify-send -h "string:bgcolor:#bf616a"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$CHARGING"                 \
            "$1"                                             \
            "$2"
}


notify_greenv2() {
  notify-send -h "string:bgcolor:#a3be8c"                    \
            -h "string:fgcolor:#d8dee9"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$FULL"                     \
            "$1"                                             \
            "$2"
}

notify_gray() {
  notify-send -h "string:bgcolor:#4C566A"                    \
            -h "string:fgcolor:#d8dee9"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$HALF"                     \
            "$1"                                             \
            "$2"
}

dunstctl close
if [[ "$CURRENT_LEVEL" -ge 96 && ("$CURRENT_STATUS" == "Charging" || "$CURRENT_STATUS" == "Unknown") ]]; then
  notify_green "Battery" "Level $CURRENT_LEVEL"
elif [[ "$CURRENT_LEVEL" -ge 96 && "$CURRENT_STATUS" == "Discharging" ]]; then
  notify_greenv2 "Battery" "Level $CURRENT_LEVEL"
elif [[ "$CURRENT_LEVEL" -le 25 && ("$CURRENT_STATUS" == "Charging" || "$CURRENT_STATUS" == "Unknown") ]]; then
  notify_redv2 "Battery" "Level $CURRENT_LEVEL"
elif [[ "$CURRENT_LEVEL" -le 25 && "$CURRENT_STATUS" == "Discharging" ]]; then
  notify_red "Battery" "Level $CURRENT_LEVEL"
else
  notify_gray "Battery" "Level $CURRENT_LEVEL"
fi

