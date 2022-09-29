#!/bin/sh

is_eww_opened() {
  window="$(eww windows | grep "\*$1" | tr --delete '*')"
  [ "$window" = "$1" ] && echo 1 || echo 0
}

while sleep 10; do
  opened="$(is_eww_opened lumin)"
  if ! pgrep -x picom > /dev/null; then
    [ "$opened" -eq 1 ] && eww close lumin melody origin
    continue
  fi

  bar_opened="$(is_eww_opened vertigo)"

  if [ "$bar_opened" -eq 1 ] && [ "$opened" -eq 1 ]; then
    eww close lumin melody origin
  elif [ "$bar_opened" -eq 1 ]; then
    continue
  fi

  if bspc query --nodes --node focused.\!hidden; then
    [ "$opened" -eq 1 ] && eww close lumin melody origin
  else
    [ "$opened" -eq 0 ] && {
      eww open-many lumin melody origin
      xdo lower -N eww-lumin
      xdo lower -N eww-melody
      xdo lower -N eww-origin
    }
  fi
done

# vim:ft=sh
