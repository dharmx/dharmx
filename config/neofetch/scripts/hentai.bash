#!/usr/bin/env bash

tmpfile="$(mktemp)"
if [ $(echo "$1" | grep "#*[[:digit:]]*") ]; then
  id=$(echo "$1" | grep -o "[[:digit:]]*")
else
  nurl=$(curl -fsSL "https://wholesomelist.com/random" | grep -m1 -o "https://nhentai\.net/g/[[:digit:]]*")
  id=$(echo "$nurl" | grep -o "[[:digit:]]*")
fi


url=$(curl -fsSL "https://nhentai.net/g/$id/" | grep -o "https://t\.nhentai\.net/galleries/[[:digit:]]*/cover\.[[:lower:]]*" | head -1)
format=$(echo "$url" | grep -o "\.[[:lower:]]*$")
curl -fsSLo "$tmpfile$format" "$url"

if [ "$format" = ".gif" ]; then
  convert "$tmpfile$format[0]" "$tmpfile.jpg"
  rm "$tmpfile$format"
  mv "$tmpfile.jpg" "$tmpfile$format"
fi

if [ "$TERM" = "xterm-kitty" ]; then
  command -v convert > /dev/null 2>&1 && neofetch --config "$XDG_CONFIG_HOME/neofetch/configs/flowerskull.conf" --source "$tmpfile$format" || kitty_imagemagick_warn=true
else 
  printf "[36m[1mNot Supported[0m\n"
fi

printf "[36m[1mNHentai tag: [0m#$id\n"
rm "$tmpfile" "$tmpfile$format"
[ "$kitty_imagemagick_warn" = "true" ] && echo "WARN: imagemagick is required for kitty image backend"

