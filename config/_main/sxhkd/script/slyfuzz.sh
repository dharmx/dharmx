#!/bin/sh
# shellcheck disable=2086,2046

## fzf can be used too
select=$(printf "St\nkitty\nTym\nNemo" | rofi -dmenu -prompt 'slop: ')
[ $select ] || exit 1
bspc rule -a $select -o state=floating rectangle=$(slop)
eval "$(echo $select | awk '{print tolower($0)}')"

# vim:filetype=sh
