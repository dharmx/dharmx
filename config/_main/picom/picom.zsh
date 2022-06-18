#!/usr/bin/env zsh

if [[ "$(pidof picom)" != "" ]]; then
  pkill picom
  notify-send -a "picom" -i "computer-fail" -u critical "Picom" "The compositer is now disabled. Press Super + Slash to enable it again."
else
  picom --config "$XDG_CONFIG_HOME/picom/config.ini" &
  notify-send -a "picom" -i "computer" "Picom" "The compositer is now enabled."
fi

# vim: ft=bash

