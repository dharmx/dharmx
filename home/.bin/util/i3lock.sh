#!/bin/sh

USERNAME="$1"

LOCKSCREEN_WALL="/home/$USERNAME/Pictures/wallpapers/radium/output-1659958136.png"
DEFAULT_DPMS=$(xset q | awk '/^[[:blank:]]*DPMS is/ {print $(NF)}')
LOCK_TIMEOUT=5 ### In Seconds

DUNST_RUNNING="$(pgrep -x dunst)"
PCTL_RUNNING="$(pgrep playerctld)"
MPD_RUNNING="$(pgrep mpd)"

PCTL_STATE=""
MPD_STATE=""
DUNST_STATE=""

prelock() {
  [ "$DEFAULT_DPMS" = Enabled ] && xset dpms "$LOCK_TIMEOUT"
  if [ "$DUNST_RUNNING" ]; then
    DUNST_STATE="$(dunstctl is-paused)"
    [ "$DUNST_STATE" = false ]      \
      && dunstctl set-paused true   \
      && DUNST_STATE="true:c"
  fi
  if [ "$PCTL_RUNNING" ]; then
    PCTL_STATE="$(playerctl status)"
    [ "$PCTL_STATE" = Playing ] \
      && playerctl pause        \
      && PCTL_STATE="Paused:c"
  fi
  if [ "$MPD_RUNNING" ] && [ "$(command -v mpc)" ]; then
    MPD_STATE="$(mpc | awk '{print $1}' | sed -n 2p | tr -d '[]')"
    echo "$MPD_STATE"
    [ "$MPD_STATE" = playing ]  \
      && mpc pause              \
      && MPD_STATE=paused:c
  fi
}

foreground="$(xrdb -query | grep 'foreground:' | awk '{print $NF}')"
background="$(xrdb -query | grep 'background:' | awk '{print $NF}')"
black="$(xrdb -query | grep 'color0:' | awk '{print $NF}')"
red="$(xrdb -query | grep 'color1:' | awk '{print $NF}')"
green="$(xrdb -query | grep 'color2:' | awk '{print $NF}')"
yellow="$(xrdb -query | grep 'color3:' | awk '{print $NF}')"
blue="$(xrdb -query | grep 'color4:' | awk '{print $NF}')"
magenta="$(xrdb -query | grep 'color5:' | awk '{print $NF}')"
cyan="$(xrdb -query | grep 'color6:' | awk '{print $NF}')"
white="$(xrdb -query | grep 'color7:' | awk '{print $NF}')"
grey="$(xrdb -query | grep 'color8:' | awk '{print $NF}')"
shade="$(xrdb -query | grep 'shade07:' | awk '{print $NF}')"

lock() {
  i3lock                            \
    --nofork                        \
    --beep                          \
    --fill                          \
    --force-clock                   \
    --ignore-empty-password         \
    --show-failed-attempts          \
    --pass-media-keys               \
    --pass-screen-keys              \
    --pass-power-keys               \
    --pass-volume-keys              \
    --pointer=default               \
    --screen=0                      \
    --radius=25                     \
    --ring-width=20                 \
    --color='#00000000'             \
    --insidewrong-color='#00000000' \
    --inside-color='#00000000'      \
    --insidever-color='#00000000'   \
    --ring-color="$red"             \
    --ringver-color="$green"        \
    --ringwrong-color="$red"        \
    --keyhl-color="$cyan"           \
    --separator-color="$yellow"     \
    --verif-color="$green"          \
    --wrong-color="$blue"           \
    --modif-color="$magenta"        \
    --time-color="$blue"            \
    --date-color="$red"             \
    --greeter-color="$cyan"         \
    --timeoutline-color="$magenta"  \
    --time-str=%H:%M                \
    --date-str='%A, %e %B'          \
    --verif-text=''                 \
    --wrong-text=''                 \
    --noinput-text=''               \
    --lock-text=''                  \
    --lockfailed-text=''            \
    --greeter-text="Hello, $USER."  \
    --image="$LOCKSCREEN_WALL"      \
    --time-align=1                  \
    --date-align=1                  \
    --verif-align=2                 \
    --wrong-align=2                 \
    --modif-align=2                 \
    --greeter-align=2               \
    --timeoutline-width=5           \
    --time-size=300                 \
    --date-size=50                  \
    --date-font=Caviar\ Dreams      \
    --verif-font=Caviar\ Dreams     \
    --wrong-font=Caviar\ Dreams     \
    --greeter-font=Caviar\ Dreams   \
    --time-font=Koulen              \
    --time-pos=100:850              \
    --date-pos=105:910              \
    --greeter-pos=275:150           \
    --ind-pos=1800:130
}

postlock() {
  [ "$DEFAULT_DPMS" = Enabled ] && xset dpms 0
  # [ "$DUNST_STATE" = true:c ] && dunstctl set-paused false
  # [ "$PCTL_STATE" = Paused:c ] && playerctl play
  # [ "$MPD_STATE" = paused:c ] && mpc play
}

sleep "$LOCK_TIMEOUT"
prelock &
lock
postlock

# vim:ft=bash:nowrap
