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
launch ksuperkey -t 100 -e "'Super_L=Super_L|d'"
launch stalonetray --config '$XDG_CONFIG_HOME/tray/config.conf'
launch parcellite --no-icon # clipboard manager
launch dunst -config '$XDG_CONFIG_HOME/dunst/config.ini'
launch playerctld daemon

## Disabled
## launch mpd
## launch picom --config '$XDG_CONFIG_HOME/picom/config.ini' &
## launch spotifyd &
## launch plank --name bottom-dock
## launch eww open vertigo
## launch '$XDG_CONFIG_HOME/eww/src/shell/logger.py' init

# vim:ft=sh
