#!/bin/env bash

BACKGROUND="string:bgcolor:#a3be8c"
FOREGROUND="string:fgcolor:#2e3440"
FRAME="string:frcolor:#00000000"
# ICON=$XDG_CONFIG_HOME/dunst/verification.png
#            -i "$ICON"          \
notify-send -h "$BACKGROUND"    \
            -h "$FOREGROUND"    \
            -h "$FRAME"         \
            "$1"                \
            "$2"
