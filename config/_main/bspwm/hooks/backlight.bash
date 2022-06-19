#!/usr/bin/env bash

function notify() {
	if [ "$5" = warn ]; then
		notify-send -u critical -a brightness -i "$1" -h "int:value:$2" "$3" "$4"
	elif [ "$5" = low ]; then
		notify-send -u low -a brightness -i "$1" -h "int:value:$2" "$3" "$4"
	else
		notify-send -a brightness -i "$1" -h "int:value:$2" "$3" "$4"
	fi
}

function cases() {
	case "$2" in
	9[1-9] | 100) notify "display-brightness-high-symbolic" "$2" " Brightness Warning!" "Abnormal brightness level: $2%" "warn" ;;
	8[1-9] | 90) notify "display-brightness-high-symbolic" "$2" " Brightness" "Abnormal brightness level: $2%" "warn" ;;
	7[1-9] | 80) notify "display-brightness-medium-symbolic" "$2" "Brightness" "Brightness $1 to $2%" ;;
	6[1-9] | 70) notify "display-brightness-medium-symbolic" "$2" "Brightness" "Brightness $1 to $2%" ;;
	5[1-9] | 60) notify "display-brightness-medium-symbolic" "$2" "Brightness" "Brightness $1 to $2%" ;;
	4[1-9] | 50) notify "display-brightness-medium-symbolic" "$2" "Brightness" "Brightness $1 to $2%" ;;
	3[1-9] | 40) notify "display-brightness-medium-symbolic" "$2" "Brightness" "Brightness $1 to $2" ;;
	2[1-9] | 30) notify "display-brightness-low-symbolic" "$2" "Brightness" "Brightness $1 to $2%" ;;
	1[1-9] | 20) notify "display-brightness-low-symbolic" "$2" "Brightness" "Brightness $1 to $2%" ;;
	[2-9] | 10) notify "display-brightness-low-symbolic" "$2" "Brightness" "Brightness $1 to $2%" "low" ;;
	1) notify "display-brightness-off-symbolic" "$2" " Brightness Warning!" "Brightness level not recommended" "low" ;;
	0) notify "display-brightness-off-symbolic" "$2" "Brightness" "Screen is offline" "low" ;;
	esac
}

function subscribe() {
	local old new
	old=$(xbacklight -get)
	while sleep 0.1; do
		new=$(xbacklight -get)
		if [ "$new" -gt "$old" ]; then
			cases "increased" "$new"
			old="$new"
		elif [ "$new" -lt "$old" ]; then
			cases "decreased" "$new"
			old="$new"
		fi
	done
}

subscribe

# vim:ft=sh:nowrap
