#!/usr/bin/env bash

CONFIG_DIR="$XDG_CONFIG_HOME/tint2/configs"

launch() {
	if [[ "$(pidof tint2)" != "" ]]; then
		killall tint2
		bspc config left_padding 0
	fi

	tint2 -c "$CONFIG_DIR/bigtime.tint2rc" &>/dev/null &
	tint2 -c "$CONFIG_DIR/hwcontrol.tint2rc" &>/dev/null &
	tint2 -c "$CONFIG_DIR/hwstats.tint2rc" &>/dev/null &
	tint2 -c "$CONFIG_DIR/launcher.tint2rc" &>/dev/null &
	tint2 -c "$CONFIG_DIR/workspaces.tint2rc" &>/dev/null &
	tint2 -c "$CONFIG_DIR/tasks.tint2rc" &>/dev/null &
}

toggle_panel() {
	"$XDG_CONFIG_HOME"/tint2/scripts/panel-toggle.bash
}

if [[ "$1" == "--launch" ]]; then
	launch
elif [[ "$1" == "--toggle-panel" ]]; then
	toggle_panel
elif [[ "$1" == "--kill" ]]; then
	killall tint2
fi