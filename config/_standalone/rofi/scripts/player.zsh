#!/usr/bin/env zsh

typeset players="$(playerctl --list-all)"
typeset choice=""
typeset primed=""
typeset menu=()

## config settings
typeset _cfg_selected=" "
typeset _cfg_playing=""
typeset _cfg_paused=""

typeset count=0
print "$players" | while read -r player
do
  local info="$(playerctl --player "$player" metadata --format '{{ artist }} - {{ title }}')"

  local selected="$([ $count -eq 0 ] \
    && print "$_cfg_selected" \
    || print "")"

  local state="$([ "$(playerctl --player "$player" status)" = "Playing" ] \
    && print "$_cfg_playing" \
    || print "$_cfg_paused")"

  primed+="$selected$state $(print "$player" \
    | awk --field-separator '.' '{print $1}') $info:><:$player\n"
  count=$((count+1))
done

choice="$(print "$primed" \
  | head --lines=-1 \
  | awk --field-separator ':><:' '{print $1}' \
  | rofi -i -dmenu)"

print "$primed" | head --lines=-1 | while read -r player
do
  [ "$(print "$player" | awk --field-separator ':><:' '{print $1}')" = "$choice" ] \
    && eval "playerctld shift"
done


# vim:filetype=zsh
