#!/usr/bin/env bash

for class in eww-disclose eww-avatar eww-chrono; do
  wid="$(xdo id -N "$class")"
  [ "$wid" ] && xqp 0 "$wid" || { eww windows | grep "\*${class:4}" && eww close "${class:4}"; }
done

# vim:ft=sh
