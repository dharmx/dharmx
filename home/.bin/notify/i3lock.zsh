#!/usr/bin/env bash

background="#101317"
color0='#23242A'
color8='#949494'
color1='#f87070'
color9='#f87070'
color2='#79dcaa'
color10='#36c692'
color3='#ffe59e'
color11='#ffe59e'
color4='#7ab0df'
color12='#7ab0df'
color5='#c397d8'
color13='#b77ee0'
color6='#70c0ba'
color14='#54ced6'
color7='#d4d4d5'
color15='#ffffff'


LOCKSCREEN_WALL="$XDG_PICTURES_DIR/wallpapers/radium/painting.png"
DEFAULT_DPMS=$(xset q | awk '/^[[:blank:]]*DPMS is/ {print $(NF)}')
LOCK_TIMEOUT=5 ### In Seconds
DUNST_INSTALLED=false && [[ -e "$(command -v dunstctl)" ]] && DUNST_INSTALLED=true
DUNST_IS_PAUSED=false && [[ "$DUNST_INSTALLED" == "true" ]] && DUNST_IS_PAUSED=$(dunstctl is-paused)

## Open widgets
prelock() {
  if [ "$DEFAULT_DPMS" == "Enabled" ]; then
    xset dpms "$LOCK_TIMEOUT"
  fi

  if [[ "$DUNST_INSTALLED" == "true" && "$DUNST_IS_PAUSED" == "false" ]]; then
    dunstctl set-paused true
  fi
}

lock() {
  i3lock --beep --image="/home/maker/Pictures/wallpapers/radium/geo-night.jpg" --max --pointer=default --ignore-empty-password --show-failed-attempts --radius 40 --wrong-text=" " --wrong-font="Iosevka Nerd Font" --wrong-pos 955:200 --wrong-size="100" --greeter-text=" " --greeter-font="Iosevka Nerd Font" --greeter-size="80" --greeter-pos 955:950 --no-modkey-text --bar-indicator --bar-direction=2 --bar-base-width 40 --bar-pos 0:1085 --bar-count 10 --pass-media-keys --pass-screen-keys --pass-volume-keys --pass-power-keys
}

postlock() {
  if [ "$DEFAULT_DPMS" == "Enabled" ]; then
    xset dpms 0
  fi
}

## Launch or close widgets accordingly
if [[ ! -f "$FILE" ]]; then
  prelock
  lock
else
  postlock
fi

# vim:ft=bash:nowrap
