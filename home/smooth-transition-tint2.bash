#!/usr/bin/env bash

if [[ "$(pidof polybar)" != "" ]]; then
  pkill polybar
  bspc config top_padding 0
fi

if [[ "$(pidof tint2)" != "" ]]; then
  pkill tint2
  bspc config left_padding 0
fi

tint2 &> /dev/null & exit 0

