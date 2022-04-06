#!/usr/bin/env bash

crunch_appname=$(echo "$1" | sed  '/^$/d')
crunch_summary=$(echo "$2" | sed  '/^$/d' | tr $'\n' ' ')
crunch_body=$(echo "$3" | sed  '/^$/d' | tr $'\n' ' ')
crunch_icon=$(echo "$4" | sed  '/^$/d')
crunch_urgency=$(echo "$5" | sed  '/^$/d')
timestamp=$(date +"%I:%M %p")

if [[ "$crunch_appname" == "spotify" ]]; then
    crunch_icon="$(playerctl metadata mpris:artUrl)"
fi

cache="$XDG_CACHE_HOME/notify"
if [ ! -x "$cache" ]; then
	mkdir "$cache"
fi

echo -en "$timestamp\n$crunch_urgency\n$crunch_icon\n$crunch_body\n$crunch_summary\n$crunch_appname\n" >> "$cache/triggered.log"
