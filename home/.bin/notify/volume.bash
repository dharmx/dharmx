#!/usr/bin/env bash

muted="$(pamixer --get-mute)"
level="$(pamixer --get-volume)"
icon=''
urgency=''

function fetch() {
  if [ $level -eq 0 ]; then
    icon=volume-level-none
    urgency=low
  elif [ $level -le 5 ]; then
    icon=volume-level-low
  elif [ $level -le 10 ]; then
    icon=volume-level-low
    urgency=low
  elif [ $level -le 15 ]; then
    icon=volume-level-low
    urgency=low
  elif [ $level -le 20 ]; then
    icon=volume-level-low
    urgency=low
  elif [ $level -le 25 ]; then
    icon=volume-level-low
    urgency=low
  elif [ $level -le 30 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 35 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 40 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 45 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 50 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 55 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 60 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 65 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 70 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 75 ]; then
    icon=volume-level-medium
    urgency=normal
  elif [ $level -le 80 ]; then
    icon=volume-level-high
    urgency=critical
  elif [ $level -le 85 ]; then
    icon=volume-level-high
    urgency=critical
  elif [ $level -le 90 ]; then
    icon=volume-level-high
    urgency=critical
  elif [ $level -le 95 ]; then
    icon=volume-level-high
    urgency=critical
  elif [ $level -le 100 ]; then
    icon=volume-level-high
    urgency=critical
  fi
}

function notify() {
  eval "notify-send -a volume -u $urgency -i $1 $2 '$3' '$4'"
}

function toggle() {
  fetch
  if [ $muted = true ]; then
    notify $icon "-h int:value:$level" Pulseaudio 'Volume has been unmuted.'
  else
    notify audio-volume-muted-blocked-panel "" Pulseaudio 'Volume has been muted.'
  fi
  pamixer --toggle-mute
}

function increase() {
  pamixer --increase 5
  fetch
  notify $icon "-h int:value:$level" Pulseaudio "Volume increased to $level%."
}

function decrease() {
  pamixer --decrease 5
  fetch
  notify $icon "-h int:value:$level" Pulseaudio "Volume decreased to $level%."
}

case "$1" in
--toggle|-T)
	toggle
	;;
--increase|-I)
	increase
	;;
--decrease|-D)
	decrease
	;;
*)
    echo 'Unsupported action!'
    ;;
esac

# vim:filetype=sh
