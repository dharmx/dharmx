#!/usr/bin/env zsh

function preboot() {
  local args=($*)
  local running="$(pgrep -x "$args[1]")"
  [ "$running" ] && kill "$running" 2>/dev/null
  eval "$1 ${args[2,-1]} &>/dev/null"
  echo -e "$(tput setf 1)INFO\e[0m: Restarted $args[1]!"
}

# launch some nice apps
killall python bspc 2>/dev/null
preboot sxhkd -c '$XDG_CONFIG_HOME/sxhkd/config.sx' &
preboot ksuperkey -t 100 -e "'Super_L=Super_L|d'" &
preboot eww open vertigo &
preboot stalonetray --config '$XDG_CONFIG_HOME/tray/config.conf' &
preboot parcellite --no-icon & # clipboard manager
preboot dunst -config '$XDG_CONFIG_HOME/dunst/config.ini' &
preboot playerctld daemon &
preboot mpd &

## Disabled
## preboot picom --config '$XDG_CONFIG_HOME/picom/config.ini' &
## preboot spotifyd &
## preboot plank --name bottom-dock &

# vim:ft=zsh
