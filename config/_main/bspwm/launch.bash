#!/usr/bin/env bash
# shellcheck disable=2016

function launch() {
  local running
  running="$(pgrep -x "$1")"
  [ "$running" ] && kill "$running" 2> /dev/null
  eval "$* &>/dev/null &"
  echo -e "$(tput setf 1)INFO\e[0m: Restarted $1."
}

# launch some nice apps
launch sxhkd
launch stalonetray
launch ~/.config/eww/.venv/bin/python ~/.config/eww/src/shell/logger.py init
launch picom --config ~/.config/picom/config.ini
launch eww open vertigo

## Disabled
## launch plank --name bottom-dock

# vim:ft=sh
