#!/usr/bin/env bash

ICON="$XDG_CONFIG_HOME/tint2/icons/today_white_48dp.svg"

dunstctl close
dunstify -i "$ICON" "Today's date is $(date '+%A, %e %B')"

