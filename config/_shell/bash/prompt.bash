#!/usr/bin/env bash

_DIR_SEP_FG="$(tput setaf 4)"
_DIR_SEP_BG="$(tput setab 4)"
_DIR_BG_ALT="$(tput setab 4)"
_DIR_BG="$(tput setab 0)"
_DIR_FG="$(tput setaf 5)"
_DIR_STYLE="$(tput bold)"

_RESET="\e[0m"

PS1="$_DIR_BG_ALT $_DIR_BG$_DIR_FG$_DIR_STYLE$_DIR_BG$_DIR_FG \W $_RESET "
PS2=""
PS3=""
