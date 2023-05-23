#!/usr/bin/env bash

xmodmap -e "$1"
notify-send -a sxhkd Xmodmap -i custom-work -u normal "Current: $(
  xmodmap -pp \
  | head -n7 \
  | tail -n3 \
  | tr -d ' ' \
  | awk -F '' '{print $1" "$2}' \
  | awk '{
    for (i=1;i<=NF;i++)
      a[i,NR]=$i
    } END {
    for (i=1;i<=NF;i++)
      for (j=1;j<=NR;j++)
        printf "%s%s", a[i,j], (j==NR?ORS:OFS)
    }')"

# vim:filetype=bash
