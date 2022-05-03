#!/usr/bin/env bash
# shellcheck disable=1091

source "$HOME/.scripts/notify/factory.bash"

notify() {
	MUTED=$(pacmd list-sources | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
	DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')

	if [ "$MUTED" = "yes" ]; then
		pactl set-source-mute "$DEFAULT_SOURCE" 0
		microphone "mic" "Microphone" "The microphone has been unmuted."
	else
		pactl set-source-mute "$DEFAULT_SOURCE" 1
		microphone "mic-off" "Microphone" "The microphone has been muted."
	fi
}

notify

# vim:ft=sh:nowrap
