#!/bin/bash
# shellcheck disable=2016

function loop() {
  echo -e "$(tput setb 1) $(tput setf 0)INFO \e[0m Right click to exit loop."
  while :; do
    node_id="$(xdotool selectwindow 2> /dev/null)"
    [ "$node_id" ] || exit 0 && eval "$*"
  done
}

function unhide_all() {
  bspc query --nodes --node .hidden | while read -r node_id; do
    bspc node "$node_id" --flag hidden=off
  done
}

function ewmh_unhide_all() {
  lsw -a | while read -r node_id; do
    xdotool windowstate --remove HIDDEN "$node_id"
  done
}

case "$1" in
  --hide-loop | -s) loop bspc node '$node_id' --flag hidden=on ;;
  --close-loop | -c) loop bspc node '$node_id' --flag hidden=on ;;
  --unhide-all | -a) unhide_all ;;

  --ewmh-hide-loop | -sw) loop xdotool windowstate --add HIDDEN '$node_id' ;;
  --ewmh-close-loop | -cw) loop xdotool windowclose '$node_id' ;;
  --ewmh-unhide-all | -aw) ewmh_unhide_all ;;

  --one-shot-hide | -x) xdotool selectwindow | xargs --replace=++ bspc node ++ --flag hidden=on ;;
  --one-shot-kill | -d) xdotool selectwindow | xargs --replace=++ bspc node ++ --close ;;

  --help | -h) echo -e "$(tput setb 3) $(tput setf 0)USAGE \e[0m Brief script options
  skunk -{s,c,a}
  skunk -{x,d}
  skunk -{sw,cw,aw}

$(tput setb 3) $(tput setf 0)DESCR \e[0m Options and their descriptions
$(tput setf 5) :: bspwm only \e[0m
  --hide-loop|-s              keep on minimizing windows until right click is pressed
  --close-loop|-c             keep on killing windows until right click is pressed
  --unhide-all|-a             unhide all hidden / minimized windows

$(tput setf 5) :: all ewmh wm \e[0m
  --ewmh-hide-loop|-sw        see [bspwm only]
  --ewmh-close-loop|-cw       see [bspwm only]
  --ewmh-unhide-all|-aw       see [bspwm only]

$(tput setf 5) :: one time only \e[0m
  --one-shot-hide|-x          hide only one window
  --one-shot-kill|-d          kill only one window
  " ;;

  *) echo -e "$(tput setb 1) $(tput setf 0)INFO \e[0m Usage examples
  skunk -{s,c,a}
  skunk -{x,d}
  skunk -{sw,cw,aw}
Use -h to see more." ;;
esac

# vim:ft=sh
