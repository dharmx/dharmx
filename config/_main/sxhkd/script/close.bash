#!/usr/bin/env bash

pidof eww || exit 1

wm_classes=(Pavucontrol mpv eww-power)
wid_active="$(xdotool getactivewindow)"
length="${#wm_classes}"

for wm_class in "${wm_classes[@]}"; do
  if [[ "$wm_class" == "eww-"* ]]; then
    eww close "$(echo "$wm_class" | cut -c5-)"
    continue
  fi
  wm_class_active="$(xdotool getwindowclassname "$wid_active")"
  [ "$wm_class_active" = "$wm_class" ] && bspc node "$wid_active" --close && length=$((--length))
done

[ "$length" = "${#wm_classes}" ] && echo -e "$(tput setf 1)INFO\e[0m: No action taken!"

# vim:filetype=sh
