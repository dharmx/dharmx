#!/usr/bin/env bash

MUTED=$(pacmd list-sources | awk '/\*/,EOF {print}' | awk '/muted/ {print $2; exit}')
DEFAULT_SOURCE=$(pacmd list-sources | awk '/\*/,EOF {print $3; exit}')

if [ "$MUTED" = yes ]; then
	pactl set-source-mute "$DEFAULT_SOURCE" 0
	notify-send -a microphone -i custom-voice-unmuted Microphone "The microphone has been unmuted."
else
	pactl set-source-mute "$DEFAULT_SOURCE" 1
	notify-send -a microphone -i custom-voice-muted Microphone "The microphone has been muted."
fi

# vim:ft=sh:nowrap
