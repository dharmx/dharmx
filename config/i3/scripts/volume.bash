#!/usr/bin/env bash

OFF="$XDG_CONFIG_HOME/i3/images/volume/twotone_volume_off_white_48dp.png"
ON="$XDG_CONFIG_HOME/i3/images/volume/twotone_volume_mute_white_48dp.png"
DOWN="$XDG_CONFIG_HOME/i3/images/volume/twotone_volume_down_white_48dp.png"
UP="$XDG_CONFIG_HOME/i3/images/volume/twotone_volume_up_white_48dp.png"

notify_template() {
	dunstify -u "$1" \
		-i "$2" \
		"$3" \
		"$4"
}

toggle() {
	dunstctl close

	MUTED=$(pacmd list-sinks | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
	DEFAULT_SOURCE=$(pacmd list-sinks | awk '/\*/,EOF {print $3; exit}')
	LEVEL=$(pacmd list-sinks | grep -A 7 "\* index" | grep volume | awk -F/ '{print $2}' | tr -d ' ' | sed 's/%$//')

	if [ "$MUTED" = "yes" ]; then
		pactl set-sink-mute "$DEFAULT_SOURCE" 0
		notify_template "low" "$ON" "Volume" "Volume has been unmuted. Level $LEVEL%"
	else
		pactl set-sink-mute "$DEFAULT_SOURCE" 1
		notify_template "low" "$OFF" "Volume" "Volume has been muted."
	fi
}

increase() {
	dunstctl close

	LEVEL=$(pacmd list-sinks | grep -A 7 "\* index" | grep volume | awk -F/ '{print $2}' | tr -d ' ' | sed 's/%$//')
	DEFAULT_SOURCE=$(pacmd list-sinks | awk '/\*/,EOF {print $3; exit}')

	if [[ "$LEVEL" -eq 100 ]]; then
		notify_template "critical" "$UP" " Volume Warning!" "Abnormal volume level. Level: 100%"
	elif [[ "$LEVEL" -ge "65" ]]; then
		pactl set-sink-volume "$DEFAULT_SOURCE" +5%
		notify_template "critical" "$UP" " Volume Warning!" "Abnormal volume level. Level: $(($LEVEL + 5))%"
	else
		pactl set-sink-volume "$DEFAULT_SOURCE" +5%
		notify_template "medium" "$UP" "Volume Increased" "Increased volume by 5%. Level: $(($LEVEL + 5))%"
	fi
}

decrease() {
	dunstctl close

	LEVEL=$(pacmd list-sinks | grep -A 7 "\* index" | grep volume | awk -F/ '{print $2}' | tr -d ' ' | sed 's/%$//')
	DEFAULT_SOURCE=$(pacmd list-sinks | awk '/\*/,EOF {print $3; exit}')

	pactl set-sink-volume "$DEFAULT_SOURCE" -5%
	if [[ "$LEVEL" -eq 0 ]]; then
		notify_template "critical" "$DOWN" " Volume Warning!" "Inaudible volume level. Level: 0%"
	elif [[ "$LEVEL" -ge 65 ]]; then
		notify_template "critical" "$DOWN" " Volume Warning!" "Abnormal volume level. Level: $((LEVEL - 5))%"
	else
		notify_template "medium" "$DOWN" "Volume Decreased" "Decreased volume by 5%. Level: $((LEVEL - 5))%"
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
