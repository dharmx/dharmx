#!/bin/env bash

BACKGROUND="string:bgcolor:#3B4252"
FOREGROUND="string:fgcolor:#D8DEE9"
FRAME="string:frcolor:#00000000"

notify-send -h "$BACKGROUND"    \
            -h "$FOREGROUND"    \
            -h "$FRAME"         \
            -i "$1"             \
            "$2"                \
            "$3"
