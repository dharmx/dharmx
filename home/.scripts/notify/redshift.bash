#!/bin/env bash

source "$HOME/.scripts/notify/factory.bash"

FILE="$XDG_CACHE_HOME/redshift_launch"
if [[ ! -f "$FILE" ]]; then
	touch "$FILE"
	redshift &
	night "nightmode-on" "Nightmode" "Nightmode has been turned on"
else
	killall redshift &
	rm "$FILE"
	night "nightmode-off" "Nightmode" "Nightmode has been turned off"
fi
