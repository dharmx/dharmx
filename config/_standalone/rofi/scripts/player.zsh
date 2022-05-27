#!/usr/bin/env zsh

typeset -g players="$(playerctl --list-all)"
typeset -g choice=""
typeset -g primed=""
typeset -g menu=()

## config settings
typeset -g _cfg_selected=" "
typeset -g _cfg_playing=""
typeset -g _cfg_paused=""

typeset count=0
print "$players" | while read -r player
do
  local info="$(playerctl --player="$player" metadata --format '{{ artist }} - {{ title }}')"

  local selected="$([ $count -eq 0 ] \
    && print "$_cfg_selected" \
    || print "")"

  local state="$([ "$(playerctl --player "$player" status)" = "Playing" ] \
    && print "$_cfg_playing" \
    || print "$_cfg_paused")"

  local one="$selected$state $(print "$player" | awk --field-separator '.' '{print $1}') $info"
  local two="$player"
  primed+="{\"display\": \"$one\", \"command\": \"$two\"}\n"
  count=$((count+1))
done

choice="$(print "$primed" \
  | jq --slurp --raw-output 'map(.display)[]' \
  | rofi -format 'i' -i -dmenu -p 'MPRIS Players')"
[[ "$choice" == "" ]] && exit 1
choice="$(print "$primed" | sed -n "$((choice+1))"p | jq --raw-output '.command')"
[[ "$choice" == "$(playerctl --list-all | head -n1)" ]] && exit 0

while [[ "$choice" != "$(playerctl --list-all | head -n1)" ]]
do
  eval "playerctld shift"
done

# vim:filetype=zsh
