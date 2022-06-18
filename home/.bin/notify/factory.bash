volume() {
	notify-send -a "volume" -u "$1" -h "int:value:$2" "$3" "$4" -i "$5"
}

night() {
	notify-send -a "nightmode" -i "$1" "$2" "$3"
}

# vim:ft=sh
