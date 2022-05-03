#!/usr/bin/env bash
# shellcheck disable=2154,1091

source "$HOME/.scripts/notify/factory.bash"

_cases() {
	BRIGHTNESS=$(xbacklight -get)
	TYPE="$1"

	case "$BRIGHTNESS" in
	9[1-9] | 100) notify_backlight "twotone_brightness_1" "$BRIGHTNESS" " Brightness Warning!" "Abnormal brightness level!" "warn" ;;
	8[1-9] | 90) notify_backlight "twotone_brightness_2" "$BRIGHTNESS" " Brightness" "Abnormal brightness level!" "warn" ;;
	7[1-9] | 80) notify_backlight "twotone_brightness_3" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	6[1-9] | 70) notify_backlight "twotone_brightness_4" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	5[1-9] | 60) notify_backlight "twotone_brightness_5" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	4[1-9] | 50) notify_backlight "twotone_brightness_6" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	3[1-9] | 40) notify_backlight "twotone_brightness_7" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	2[1-9] | 30) notify_backlight "twotone_flare_black" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	1[1-9] | 20) notify_backlight "twotone_flare_black" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	[2-9] | 10) notify_backlight "twotone_brightness_danger" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
	1) notify_backlight "twotone_visibility_on_white" "$BRIGHTNESS" " Brightness Warning!" "Brightness level not recommended" "warn" ;;
	0) notify_backlight "twotone_visibility_off_white" "$BRIGHTNESS" "Brightness" "Screen is offline" "warn" ;;
	esac
}

notify() {
	if [[ "$1" == "-I" ]]; then
		xbacklight -inc 1
		_cases "increased" "-I"
	elif [[ "$1" == "-D" ]]; then
		xbacklight -dec 1
		_cases "decreased" "-D"
	else
		echo "${red}Invalid Command!"
		exit 1
	fi
}

notify "$1"

# vim:ft=sh:nowrap
