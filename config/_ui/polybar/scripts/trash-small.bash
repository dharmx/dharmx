#!/usr/bin/env bash

confirm() {
	"$XDG_CONFIG_HOME"/rofi/launchers/prompt.bash
}

icon() {
	if [[ "$(ls "$XDG_DATA_HOME/Trash/files")" == "" ]]; then
    echo ""
  else
    echo ""
  fi
}

case "$1" in
  --clean)
		if [[ "$(confirm &)" == "Yup" ]]; then
			rm -rf "$XDG_DATA_HOME/Trash/files/*"
			dunstify Alert Cleaned\ Trash
		else
			dunstify Alert Operation\ Cancelled
		fi
    ;;
  --icon)
    icon
    ;;
  *)
    echo "Invalid Option!"
    ;;
esac

# vim:ft=bash:number:nowrap
