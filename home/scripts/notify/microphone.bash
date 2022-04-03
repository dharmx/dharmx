#!/usr/bin/env bash

notify_template() {
	dunstify -a "microphone" -i "$1" "$2" "$3"
}

notify() {
	MUTED=$(pacmd list-sources | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
	DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')

	if [ "$MUTED" = "yes" ]; then
		pactl set-source-mute "$DEFAULT_SOURCE" 0
		notify_template "mic-off" "Microphone" "The microphone has been unmuted."
	else
		pactl set-source-mute "$DEFAULT_SOURCE" 1
		notify_template "mic-on" "Microphone" "The microphone has been muted."
	fi
}

notify

# vim:ft=bash:nowrap
