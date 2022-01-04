#!/usr/bin/env bash

FILE="$XDG_CACHE_HOME/polybar.hidden"

dunstctl close
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	polybar-msg cmd show && dunstify -i "$XDG_CONFIG_HOME/i3/images/visibility/hidden.png" "Polybar" "Polybar is now visible."

else
	polybar-msg cmd hide && bspc config top_padding 0 && dunstify -i "$XDG_CONFIG_HOME/i3/images/visibility/visibility.png" "Polybar" "Polybar is now hidden. Unhide with Super + Shift + Slash."
	rm "$FILE"
fi
