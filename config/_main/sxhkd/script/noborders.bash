#!/usr/bin/env bash

cache="${XDG_CACHE_HOME:-~/.cache}/bspwm-floating.lock"
default="$(bspc config -m focused border_width)"

function floating() {
  [[ "$1" == "floating" && "$2" == "on" ]] \
    || bspc config -n focused border_width "$default" \
    && bspc config -n focused border_width 0
}

function start() {
  touch "$cache"
  bspc query --nodes --node .focused.floating && floating "floating" "on"
  bspc subscribe node_state | while read -r _ _ _ _ state flag; do
    floating "$state" "$flag"
    [[ ! -f "$cache" ]] && stop
  done
}

function stop() {
  echo "$cache"
  rm --force "$cache"
  bspc config -n focused border_width "$default"
  exit 0
}

case $1 in
  start) start ;;
  stop) stop ;;
esac

unset cache

# vim:filetype=sh
