#!/usr/bin/env bash
# shellcheck disable=2034

window="$1"
class="$2"
instance="$3"
consequences="$4"

function main() {
  case "$class" in
    Zettlr) 
      local wm_name
      wm_name=$(xprop -id "$window" | grep '_NET_WM_NAME' | grep --perl-regexp --only-matching '"\K[^,"]+')
      [ "$wm_name" = Preferences ] && echo "rectangle=926x724+493+175 center=on state=floating"
    ;;
    firefox) [ "$instance" = Toolkit ] && echo 'state=floating sticky=on';;
    Spotify) echo 'state=floating center=on rectangle=1080x784+416+145';;
    FromScratch) echo 'center=off state=floating rectangle=440x415+1435+40 sticky=on';;
    '')
      sleep 0.5
      local wm_class=($(xprop -id $window | grep 'WM_CLASS' | grep --perl-regexp --only-matching '"\K[^,"]+'))
      local class=${wm_class[-1]}
      [ ${#wm_class[@]} -eq 2 ] && instance=${wm_class[0]}
      [ -n "$class" ] && main
    ;;
  esac
}

main

# vim:filetype=sh
