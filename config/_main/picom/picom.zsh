#!/usr/bin/env zsh

if [ "$(pidof picom)" ]; then
  pkill picom
  notify-send -a "picom" -i "computer-fail" -u critical "Picom" "The compositer is now disabled."
else
  picom --config "$XDG_CONFIG_HOME/picom/config.ini" &
  notify-send -a "picom" -i "computer" "Picom" "The compositer is now enabled."
fi

# vim:filetype=sh

