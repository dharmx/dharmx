#!/usr/bin/env bash

FREE="$(free -m | sed -n 2p | awk '{print $3}')"
echo "<span foreground=\"#A3BE8C\"> </span><span foreground=\"#88c0d0\">$FREE</span>"

