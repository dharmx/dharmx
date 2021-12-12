#!/usr/bin/env bash

PANEL="$XDG_CONFIG_HOME/tint2/configs/workspaces.tint2rc"

if [[ "$(pgrep -f "tint2 -c $PANEL")" != "" ]]; then
  pkill -f "$PANEL"
  bspc config left_padding 0
else
  tint2 -c "$XDG_CONFIG_HOME/tint2/configs/workspaces.tint2rc" &> /dev/null &
fi

