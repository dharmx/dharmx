#!/usr/bin/env bash

PANEL="$XDG_CONFIG_HOME/tint2/configs/workspaces.tint2rc"

dunstctl close
if [[ "$(pgrep -f "tint2 -c $PANEL")" != "" ]]; then
  pkill -f "$PANEL"
  bspc config left_padding 0
  dunstify -i "$XDG_CONFIG_HOME/tint2/images/hidden.png" "Tint2" "The bar is now hidden. Unhide with Super + Shift + Backslash."
else
  tint2 -c "$XDG_CONFIG_HOME/tint2/configs/workspaces.tint2rc" &> /dev/null &
  dunstify -i "$XDG_CONFIG_HOME/tint2/images/visibility.png" "Tint2" "The bar is now visible."
fi

