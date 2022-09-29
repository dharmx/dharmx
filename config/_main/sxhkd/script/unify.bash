#!/usr/bin/env bash

# shellcheck disable=1091
source "$XDG_CONFIG_HOME/bspwm/theme.bash"
lockfile="$XDG_CACHE_HOME/bspwm_all_$1.lock"

function mod_node() {
  bspc node --state "$1" 2> /dev/null \
    || {
      rm "$lockfile"
      echo -e "No such state: '$1'\nChoose: {floating,tiled,pseudo_tiled,fullscreen}"
      exit 1
    }
}

if [ -f "$lockfile" ]; then
  # shellcheck disable=2154
  notify-send -a bspwm -i custom-color "Layout Unifier" "Reverted from <span foreground='$magenta'>$1</span> state."
  rm "$lockfile"
else
  notify-send -a bspwm -i custom-color "Layout Unifier" "Unified to <span foreground='$magenta'>$1</span> state."
  touch "$lockfile"
  {
    echo
    bspc subscribe node_add
  } | while read -r _; do
    current_desktop="$(bspc query --desktops --desktop focused --names)"
    if [[ -f "$lockfile" ]]; then
      [ "$current_desktop" -eq "$2" ] && mod_node "$1"
    else
      break
    fi
  done
fi

unset lockfile current_desktop

# vim:filetype=sh
