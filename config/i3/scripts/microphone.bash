#!/usr/bin/env bash

STATE_MUTED="$XDG_CONFIG_HOME/i3/images/microphone/baseline_mic_off_white_48dp.png"
STATE_UNMUTED="$XDG_CONFIG_HOME/i3/images/microphone/baseline_mic_white_48dp.png"

notify_template() {
	dunstify -u "$1" \
		-i "$2" \
		"$3" \
		"$4"
}

notify() {
	dunstctl close
	MUTED=$(pacmd list-sources | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
	DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')

	if [ "$MUTED" = "yes" ]; then
		pactl set-source-mute "$DEFAULT_SOURCE" 0
		notify_template "normal" "$STATE_UNMUTED" "Microphone" "The microphone has been unmuted."
	else
		pactl set-source-mute "$DEFAULT_SOURCE" 1
		notify_template "normal" "$STATE_MUTED" "Microphone" "The microphone has been muted."
	fi
}

notify
