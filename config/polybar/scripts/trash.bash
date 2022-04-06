#!/usr/bin/env bash

items="$(ls "$XDG_DATA_HOME/Trash/files" | wc -l)"

confirm() {
	"$XDG_CONFIG_HOME"/rofi/launchers/prompt.bash
}

icon() {
	if [[ $items == "0" ]]; then
    echo " Empty"
  else
    echo " $items"
  fi
}

case "$1" in
  --clean)
    if [[ $items == "0" ]]; then
      dunstify -i "emptytrash" "Trash" "Nothing to remove!"
      exit 0
    fi

		if [[ "$(confirm)" == "Yup" ]]; then
			rm -rf "$XDG_DATA_HOME/Trash/files"/*
			rm -rf "$XDG_DATA_HOME/Trash/info"/*

            if [[ "$items" == "1" ]]; then
			  dunstify -i "emptytrash" "Trash" "Removed 1 item"
            else
			  dunstify -i "emptytrash" "Trash" "Removed $items items"
            fi
		else
			dunstify -i "emptytrash" "Trash" "Operation cancelled!"
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
