#!/usr/bin/env bash

if [[ "$(pidof picom)" != "" ]]; then
	pkill picom
	notify-send -a "picom" -i "computer-screen-off" "Picom" "The compositer is now disabled. Press Super + Slash to enable it again."
else
	picom --config "$XDG_CONFIG_HOME/picom/config.ini" &
	notify-send -a "picom" -i "computer-screen-on" "Picom" "The compositer is now enabled."
fi

# vim: ft=bash

