#!/bin/env bash

FILE="$XDG_CACHE_HOME/redshift_launch"
if [[ ! -f "$FILE" ]]; then
  touch "$FILE"
  redshift &
  dunstctl close
  dunstify -i "$XDG_CONFIG_HOME/tint2/icons/nightmode-on.png" "Nightmode" "Nightmode has been turned on"
else
  killall redshift &
  rm "$FILE"
  dunstctl close
  dunstify -i "$XDG_CONFIG_HOME/tint2/icons/nightmode-off.png" "Nightmode" "Nightmode has been turned off"
fi
