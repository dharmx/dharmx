source "$HOME/.bin/base/colors.sh"

notify_backlight() {
	if [[ "$5" == "warn" ]]; then
		notify-send -a "brightness" -i "$1" \
			-h "string:bgcolor:$color1" \
			-h "string:fgcolor:$color0" \
			-h "int:value:$2" "$3" "$4"
	else
		notify-send -a "brightness" -i "$1" \
			-h "string:bgcolor:$background" \
			-h "string:fgcolor:$foreground" \
			-h "int:value:$2" "$3" "$4"
	fi
}

microphone() {
	notify-send -a "microphone" -i "$1" "$2" "$3"
}

volume() {
	notify-send -a "volume" -u "$1" -h "int:value:$2" "$3" "$4" -i "$5"
}

night() {
	notify-send -a "nightmode" -i "$1" "$2" "$3"
}

screenshot() {
    notify-send -a "screenshot" -i "$1" "$2" "$3"
}

# vim:ft=sh
