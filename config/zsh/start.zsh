#!/usr/bin/env zsh

SAVE="$ZDOTDIR"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh/$1"
zsh
export ZDOTDIR="$SAVE"

# vim:ft=zsh:nowrap
