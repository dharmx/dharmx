#!/usr/bin/env bash

UPDATES="$(yay -Qu 2> /dev/null | wc -l)"
echo "<span foreground=\"#EBCB8B\"> </span><span foreground=\"#88c0d0\">$UPDATES</span>"

