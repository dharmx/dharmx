#!/usr/bin/env bash

LOADAVG="$(awk '{print $1 * 100}' /proc/loadavg)"
echo "<span foreground=\"#B48EAD\"> </span><span foreground=\"#88c0d0\">$LOADAVG%</span>"

