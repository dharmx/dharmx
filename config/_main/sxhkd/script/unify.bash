#!/usr/bin/env bash

source "$XDG_CONFIG_HOME/bspwm/theme.zsh"
lockfile="$XDG_CACHE_HOME/bspwm_all_$1.lock"

if [ -f "$lockfile" ]; then
  notify-send -a bspwm "Layout Unifier" "Reverted from <span foreground='$magenta'>$1</span> state."
  rm "$lockfile"
else
  notify-send -a bspwm "Layout Unifier" "Unified to <span foreground='$magenta'>$1</span> state."
  touch "$lockfile"
  { echo; bspc subscribe node_add; } | while read -r _; do 
    if [ -f "$lockfile" ]; then 
      bspc node --state "$1" 2>/dev/null \
        || { 
          rm "$lockfile"; 
          echo -e "No such state: '$1'\nChoose: {floating,tiled,pseudo_tiled,fullscreen}";
          exit 1; 
        }
    else
      break
    fi
  done
fi

# vim:filetype=sh
