#!/bin/sh

SIZES="52 64 96 104 128 240 256 48 24"
CURRENT="$PWD"

for size in $SIZES; do
  mkdir "$HOME/.icons/custom/stock/$size"
done

cd "$HOME/.icons/custom/stock/512" || return
for icon in *; do
  mv "$icon" "custom-$icon"
done

for icon in *; do
  for dimen in $SIZES; do
    [ -f ../"$dimen"/"$icon" ] && echo "Skipping" ../"$dimen"/"$icon" && continue
    convert "$icon" -resize "$dimen"x"$dimen"\! ../"$dimen"/"$icon" && echo "Generated" ../"$dimen"/"$icon"
  done
done

cd ../..
gtk-update-icon-cache .
cd "$CURRENT" || return

# vim:ft=sh
