#!/usr/bin/env bash

sizes=(16 22 24 32 48 52 64 96 104 128 240 256 512)

pushd "${1:-$HOME/Dotfiles/dots.sh/others/icons}" || return
mkdir -p "$XDG_DATA_HOME/icons/custom/stock"
cp -r ./default "$XDG_DATA_HOME/icons"
cp ./custom/index.theme "$XDG_DATA_HOME/icons/custom"

set -x
for directory in ./custom/stock/*; do
  for size in "${sizes[@]}"; do
    [[ $size -gt $(basename "$directory") ]] && break
    mkdir -p "$XDG_DATA_HOME/icons/custom/stock/$size"
    for icon in "$directory"/*; do
      convert "$icon" -resize "$size"x"$size"\! "$XDG_DATA_HOME/icons/custom/stock/$size/custom-$(basename "$icon")"
    done
  done
done

pushd "$XDG_DATA_HOME/icons/custom" || return
gtk-update-icon-cache .
popd || return
popd || return
