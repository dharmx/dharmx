#!/usr/bin/env bash

cache="$XDG_CACHE_HOME/spt-artwork"
if [ ! -d "$cache" ]; then
  mkdir "$cache"
fi

view="$XDG_CONFIG_HOME/spotifyd/albumart.jpg"

current_art="$(playerctl metadata mpris:artUrl)"
current_album="$(playerctl metadata xesam:album)"
current_artist="$(playerctl metadata xesam:artist)"
current_title="$(playerctl metadata xesam:title)"
save="$current_artist-$current_album.jpg"

hit_eval() {
  cd "$XDG_CACHE_HOME/spt-artwork"
  for file in *;
  do
    if [[ "$file" == "$save" ]]; then
      view="$cache/$save"
      return 0
    fi
  done
  curl "$current_art" > "$cache/$save"
  view="$cache/$save"
}

dunstctl close
if [[ "$current_art" != "" ]]; then
  hit_eval
  dunstify -i "$view" "$current_title" "$current_artist - $current_album"
else
  dunstify -i "$view" "Spotifyd isn't running properly!"
fi


# vim:ft=bash:nowrap
