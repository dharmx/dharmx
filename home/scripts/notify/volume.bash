#!/usr/bin/env bash

MUTED=""
DEFAULT_SOURCE=""
LEVEL=""

source "$HOME/.scripts/notify/factory.bash"

get_level() {
	refetch
	if [[ "$MUTED" == "yes" ]]; then
		echo "audio-volume-muted-blocked-panel"
	else
		if [[ "$LEVEL" -le "10" ]]; then
			echo "audio-volume-off"
		elif [[ "$LEVEL" -le "40" ]]; then
			echo "audio-volume-low"
		elif [[ "$LEVEL" -le "70" ]]; then
			echo "audio-volume-medium"
		else
			echo "audio-volume-high"
		fi
	fi
}

refetch() {
	MUTED=$(pacmd list-sinks | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
	DEFAULT_SOURCE=$(pacmd list-sinks | awk '/\*/,EOF {print $3; exit}')
	LEVEL=$(pacmd list-sinks | grep -A 7 "\* index" | grep volume | awk -F/ '{print $2}' | tr -d ' ' | sed 's/%$//')
}

toggle() {
	refetch
	if [[ "$MUTED" == "yes" ]]; then
		pactl set-sink-mute "$DEFAULT_SOURCE" 0
		volume "low" "$LEVEL" "Volume" "Volume has been unmuted" "$(get_level)"
	else
		pactl set-sink-mute "$DEFAULT_SOURCE" 1
		volume "low" "0" "Volume" "Volume has been muted" "$(get_level)"
	fi
}

increase() {
	refetch
	if [[ "$LEVEL" -eq 100 ]]; then
		volume "critical" "$LEVEL" " Volume Warning!" "Abnormal volume level" "$(get_level)"
	elif [[ "$LEVEL" -ge "75" ]]; then
		pactl set-sink-volume "$DEFAULT_SOURCE" +5%
		volume "critical" "$((LEVEL + 5))" " Volume Warning!" "Abnormal volume level" "$(get_level)"
	else
		pactl set-sink-volume "$DEFAULT_SOURCE" +5%
		volume "normal" "$((LEVEL + 5))" "Volume Increased" "Increased volume" "$(get_level)"
	fi
}

decrease() {
	refetch
	if [[ "$LEVEL" -eq 0 ]]; then
		volume "critical" " Volume Warning!" "Inaudible volume level" "$(get_level)"
	elif [[ "$LEVEL" -ge 70 ]]; then
		pactl set-sink-volume "$DEFAULT_SOURCE" -5%
		volume "critical" "$((LEVEL - 5))" " Volume Warning!" "Abnormal volume level" "$(get_level)"
	else
		pactl set-sink-volume "$DEFAULT_SOURCE" -5%
		volume "normal" "$((LEVEL - 5))" "Volume Decreased" "Decreased volume" "$(get_level)"
	fi
}

case "$1" in
--toggle)
	toggle
	;;
--increase)
	increase
	;;
--decrease)
	decrease
	;;
esac
