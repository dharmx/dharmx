#!/usr/bin/env sh

# monitor and keep eww bar below all windows
bspc subscribe node_state | while read -r _ _ _ _ state flag; do
  [ "$state" = fullscreen ] && [ "$flag" = on ] && xdo lower -n eww-vertigo
done &

bspc subscribe node_add | while read -r _; do
  xdo lower -n stalonetray
  xdo raise -n plank
  xdo raise -n eww-disclose
  xdo raise -n eww-avatar
done &

# vim:ft=sh
