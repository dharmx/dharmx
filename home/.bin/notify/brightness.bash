#!/usr/bin/env bash

function notify_backlight() {
	if [ "$5" = warn ]; then
		notify-send -u critical -a brightness -i "$1" -h "int:value:$2" "$3" "$4"
	elif [ "$5" = low ]; then
		notify-send -u low -a brightness -i "$1" -h "int:value:$2" "$3" "$4"
	else
		notify-send -a brightness -i "$1" -h "int:value:$2" "$3" "$4"
	fi
}

function cases() {
	local brightness
    brightness=$(xbacklight -get)
	local backtype
    backtype="$1"

	case "$brightness" in
	9[1-9] | 100) notify_backlight "display-brightness-high-symbolic" "$brightness" " Brightness Warning!" "Abnormal brightness level: $brightness%" "warn" ;;
	8[1-9] | 90) notify_backlight "display-brightness-high-symbolic" "$brightness" " Brightness" "Abnormal brightness level: $brightness%" "warn" ;;
	7[1-9] | 80) notify_backlight "display-brightness-medium-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness%" ;;
	6[1-9] | 70) notify_backlight "display-brightness-medium-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness%" ;;
	5[1-9] | 60) notify_backlight "display-brightness-medium-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness%" ;;
	4[1-9] | 50) notify_backlight "display-brightness-medium-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness%" ;;
	3[1-9] | 40) notify_backlight "display-brightness-medium-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness" ;;
	2[1-9] | 30) notify_backlight "display-brightness-low-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness%" ;;
	1[1-9] | 20) notify_backlight "display-brightness-low-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness%" ;;
	[2-9] | 10) notify_backlight "display-brightness-low-symbolic" "$brightness" "Brightness" "Brightness $backtype to $brightness%" "low" ;;
	1) notify_backlight "display-brightness-off-symbolic" "$brightness" " Brightness Warning!" "Brightness level not recommended" "low" ;;
	0) notify_backlight "display-brightness-off-symbolic" "$brightness" "Brightness" "Screen is offline" "low" ;;
	esac
}

function notify() {
	if [[ "$1" == "-I" ]]; then
		xbacklight -inc 1
		cases "increased" "-I"
	elif [[ "$1" == "-D" ]]; then
		xbacklight -dec 1
		cases "decreased" "-D"
	else
		# shellcheck disable=2154
		echo "${red}Invalid Command!"
		exit 1
	fi
}

notify "$1"

# vim:ft=sh:nowrap
