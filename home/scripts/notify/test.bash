#!/usr/bin/env bash

frame="string:frcolor:#79DCAA"
background="string:bgcolor:#19191C"
foreground="string:fgcolor:#D4D4D5"

icon="bell"
urgency="normal"

title="Alert!"
body="You've got a notification."

source "$HOME/Dotfiles/nordfiles/scripts/notify/base.bash"

notify-send -i "~/Pictures/bar.png" -h "$background" -h "$foreground" -h "$frame" "$title" "$body"

mpv --keep-open=no --really-quiet "$HOME/.sounds/Smooth/stereo/count-down.oga"

# vim:ft=bash

