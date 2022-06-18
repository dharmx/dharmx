#!/bin/env bash

on="$(pidof redshift)"
if [ ! "$on" ]; then
	redshift &
	notify-send -a "nightmode" -i "night-light-symbolic" "Nightmode" "Nightmode has been turned on"
else
    kill "$on"
	notify-send -a "nightmode" -i "night-light-disabled-symbolic" "Nightmode" "Nightmode has been turned off"
fi

# vim:filetype=sh
