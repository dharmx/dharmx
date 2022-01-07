#!/usr/bin/env bash

notify_template_normal() {
	dunstify -i "$1" -h "int:value:$2" -a "brightness" "$3" "$4"
}

notify_template_low() {
	dunstify -i "$1" -h "int:value:$2" -a "brightness" "$3" "$4"
}

cases() {
	BRIGHTNESS=$(xbacklight -get)
	TYPE="$1"

	case "$BRIGHTNESS" in
		9[1-9]|100) notify_template_normal "twotone_brightness_1" "$BRIGHTNESS" " Brightness Warning!" "Abnormal brightness level!" ;;
		8[1-9]|90) notify_template_normal "twotone_brightness_2" "$BRIGHTNESS" " Brightness" "Abnormal brightness level!" ;;
		7[1-9]|80) notify_template_normal "twotone_brightness_3" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		6[1-9]|70) notify_template_normal "twotone_brightness_4" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		5[1-9]|60) notify_template_normal "twotone_brightness_5" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		4[1-9]|50) notify_template_normal "twotone_brightness_6" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		3[1-9]|40) notify_template_normal "twotone_brightness_7" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		2[1-9]|30) notify_template_normal "twotone_flare_black" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		1[1-9]|20) notify_template_normal "twotone_flare_black" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		[2-9]|10) notify_template_normal "twotone_brightness_danger" "$BRIGHTNESS" "Brightness" "Brightness $TYPE to" ;;
		1) notify_template_low "twotone_visibility_on_white" "$BRIGHTNESS" " Brightness Warning!" "Brightness level not recommended" ;;
		0) notify_template_low "twotone_visibility_off_white" "$BRIGHTNESS" "Brightness" "Screen is offline" ;;
	esac
}

notify() {
	if [[ "$1" == "-I" ]]; then
		xbacklight -inc 1
		cases "increased" "-I"
	elif [[ "$1" == "-D" ]]; then
		xbacklight -dec 1
		cases "decreased" "-D"
	else
		echo "${red}Invalid Command!"
		exit 1
	fi
}

notify "$1"

# vim:ft=bash:nowrap
