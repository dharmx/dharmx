#!/usr/bin/env bash

XRDB_BRIGHTBLUE="$(xrdb -query | grep color12 | awk '{print $2}')"

if [[ "$(bspc config -n focused focused_border_color)" == "$XRDB_BRIGHTBLUE" ]]; then
  bspc config -n focused focused_border_color "#bf616a"
  bspc config -n focused border_width 10
  bspc node focused --flag marked=on
else 
  bspc config -n focused focused_border_color "$XRDB_BRIGHTBLUE"
  bspc config -n focused border_width 0
  bspc node focused --flag marked=off
fi

