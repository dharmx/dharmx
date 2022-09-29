#!/bin/sh
# shellcheck disable=2086

pid="$(pgrep -x picom)"
if [ "$pid" ]; then
  kill "$pid"
  notify-send -a picom -i custom-crying -u critical Picom "The compositer is now disabled."
else
  picom --config "$XDG_CONFIG_HOME/picom/config.ini" &
  notify-send -a picom -i custom-vision Picom "The compositer is now enabled."
fi

# vim:ft=sh
