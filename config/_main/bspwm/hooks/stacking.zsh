#!/usr/bin/env zsh

# monitor and keep eww bar below all windows
bspc subscribe node_state | while read -r _ _ _ _ state flag
do
  [ $state = fullscreen ] && [ $flag = on ] && xdo lower -N eww-vertigo
done &

declare -a apps=('stalonetray' 'Plank' 'GIMP Startup')
peek='false'
bspc subscribe node_add | while read -r _
do
  xdo lower -N stalonetray
  xdo raise -N Plank
  if [ $peek = 'false' ]; then
    peek='true'
  fi
done &

while sleep 3
do
  xdo raise -N eww-edge_avatar
  xdo raise -N eww-edge_disclose
done

# vim:ft=zsh
