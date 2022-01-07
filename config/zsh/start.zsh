#!/usr/bin/env zsh

SAVE="$ZDOTDIR"

if [[ "$1" == "" ]]; then
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh/darkblood"
else
    export ZDOTDIR="$XDG_CONFIG_HOME/zsh/$1"
fi

zsh
export ZDOTDIR="$SAVE"

# vim:ft=zsh:nowrap
