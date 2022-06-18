#!/usr/bin/env bash

FILE="$XDG_CACHE_HOME/polybar.hidden"

if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	# polybar-msg -p "$(pidof polybar | awk '{print $2}')" cmd show && notify-send -a "bar" -i "invisible" "Polybar" "Polybar is now visible."
	polybar-msg cmd show && notify-send -a "bar" -i "invisible" "Polybar" "Polybar is now visible."
else
	# polybar-msg -p "$(pidof polybar | awk '{print $2}')" cmd hide && bspc config top_padding 0 && notify-send -a "bar" -i "visible" "Polybar" "Polybar is now hidden. Unhide with Super + Shift + Slash."
	polybar-msg cmd hide && bspc config bottom_padding 0 && notify-send -a "bar" -i "visible" "Polybar" "Polybar is now hidden. Unhide with Super + Shift + Slash."
	rm "$FILE"
fi

# vim:filetype=sh
