#!/usr/bin/env zsh

typeset -g CACHE_PATH="${XDG_CACHE_HOME:-~/.cache}/bspwm_floating.check"

function start() {
  print > "$CACHE_PATH"
  bspc subscribe node_state | while read -r state; do
    [ "$(cat "$CACHE_PATH")" = "STOP" ] \
      && print > "$CACHE_PATH" \
      && exit 0

    local node="$(print "$state" | awk '{if($(NF-1)=="floating") print $(NF-2) " " $NF}')"
    [ "$(print "$node" | awk '{print $2}')" = "on" ]  \
      && bspc config -n focused border_width 0        \
      || bspc config -n focused border_width $(bspc config -d focused border_width)
  done
}

function stop() {
  print STOP > "$CACHE_PATH"
  bspc config -n focused border_width $(bspc config -d focused border_width)
}

case $1 in
  start) start;;
  stop) stop;;
esac

unset CACHE_PATH

# vim:filetype=zsh
