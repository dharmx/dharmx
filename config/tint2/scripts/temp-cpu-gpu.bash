#!/usr/bin/env bash

TEMPERATURE="$(sensors | sed -n 21p | awk '{print $2}')  $(sensors | sed -n 27p | awk '{print $2}')"
echo "<span foreground=\"#BF616A\"> </span><span foreground=\"#88c0d0\">$TEMPERATURE</span>"

