#!/usr/bin/env bash

PANEL="$XDG_CONFIG_HOME/tint2/configs/workspaces.tint2rc"

if [[ "$(pgrep -f "tint2 -c $PANEL")" != "" ]]; then
	pkill -f "$PANEL"
	bspc config left_padding 0
	dunstify -a "bar" -i "invisible" "Tint2" "The bar is now hidden. Unhide with Super + Shift + Backslash."
else
	tint2 -c "$XDG_CONFIG_HOME/tint2/configs/workspaces.tint2rc" &>/dev/null &
	dunstify -a "bar" -i "visible" "Tint2" "The bar is now visible."
fi
