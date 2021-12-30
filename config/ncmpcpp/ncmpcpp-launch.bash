#!/usr/bin/env bash

if [[ "$(pidof mpd)" == "" ]]; then
	mpd &
fi

ncmpcpp

# vim:ft=bash:nowrap
