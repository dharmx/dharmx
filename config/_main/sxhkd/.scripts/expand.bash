#!/usr/bin/env bash

MESSAGES=(
  "$(tput setb 4) $(tput setf 0)ERROR \e[0m Node is not floating!"
  "$(tput setb 5) $(tput setf 0)USAGE \e[0m ./bsize.bash -{x,y,xy} -{e,c} [SIZE]"
  "$(tput setb 6) $(tput setf 0)EXAMPLE \e[0m ./bsize.bash -x -c 50"
  "$(tput setb 6) $(tput setf 0)EXAMPLE \e[0m $(tput setf 6)./bsize.bash -x -c 50\e[0m"
)

function resize_xaxis() {
  bspc query --nodes --node .focused.floating.\!fullscreen 1> /dev/null || return 1
  local default
  default="10"
  [ "$2" ] && default="$2"
  case "$1" in
    "--expand" | "-e")
      bspc node --resize left "-$default" 0
      bspc node --resize right "$default" 0
      ;;
    "--contract" | "-c")
      bspc node --resize left "$default" 0
      bspc node --resize right "-$default" 0
      ;;
  esac
}

function resize_yaxis() {
  bspc query --nodes --node .focused.floating.\!fullscreen 1> /dev/null || return 1
  local default
  default="10"
  [ "$2" ] && default="$2"
  case "$1" in
    "--expand" | "-e")
      bspc node --resize bottom 0 "$default"
      bspc node --resize top 0 "-$default"
      ;;
    "--contract" | "-c")
      bspc node --resize bottom 0 "-$default"
      bspc node --resize top 0 "$default"
      ;;
  esac
}

case "$1" in
  "--xaxis" | "-x") resize_xaxis "${@:2}" || echo -e "${MESSAGES[0]}" ;;
  "--yaxis" | "-y") resize_yaxis "${@:2}" || echo -e "${MESSAGES[0]}" ;;
  "--all" | "-xy") resize_xaxis "${@:2}" && resize_yaxis "${@:2}" || echo -e "${MESSAGES[0]}" ;;
  "-h" | "--help") echo -e "${MESSAGES[1]}" ;;
  *) echo -e "${MESSAGES[3]} -- use -h|--help for more." ;;
esac

unset MESSAGES

# vim:filetype=sh
