#!/usr/bin/env bash

STATUS="$(rfkill list | sed -n 2p | awk '{print $3}')"
AIRPLANE_MODE_OFF="$XDG_CONFIG_HOME/sxhkd/images/airplane/twotone_airplanemode_inactive_white_48dp.png"
AIRPLANE_MODE_ON="$XDG_CONFIG_HOME/sxhkd/images/airplane/baseline_airplanemode_active_white_48dp.png"

notify_green() {
  notify-send -h "string:bgcolor:#a3be8c"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$AIRPLANE_MODE_OFF"        \
            "$1"                                             \
            "$2"
}

notify_red() {
  notify-send -h "string:bgcolor:#bf616a"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$AIRPLANE_MODE_ON"         \
            "$1"                                             \
            "$2"
}

if [[ "$STATUS" == "no" ]]; then
  urxvt -e sudo rfkill block all
  notify_green "Airplane mode" "Airplane mode is turned on."
else 
  urxvt -e sudo rfkill unblock all
  notify_red "Airplane mode" "Airplane mode is turned off."
fi

