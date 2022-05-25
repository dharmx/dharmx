#!/usr/bin/env zsh

if [[ "$(pidof polybar)" != "" ]]; then
	killall polybar
	sleep 2
fi

config="$XDG_CONFIG_HOME/polybar/config.ini"
polybar -q -c "$config" lower &
disown
