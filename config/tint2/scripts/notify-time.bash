#!/usr/bin/env bash

ICON="$XDG_CONFIG_HOME/tint2/icons/timer_white_48dp.svg"

dunstctl close
dunstify -i "$ICON" "Current time is $(date +%r)"

