#!/usr/bin/env bash
# shellcheck disable=2034

foreground="$(xrdb -query | grep 'foreground:' | awk '{print $NF}')"
background="$(xrdb -query | grep 'background:' | awk '{print $NF}')"
black="$(xrdb -query | grep 'color0:' | awk '{print $NF}')"
red="$(xrdb -query | grep 'color1:' | awk '{print $NF}')"
green="$(xrdb -query | grep 'color2:' | awk '{print $NF}')"
yellow="$(xrdb -query | grep 'color3:' | awk '{print $NF}')"
blue="$(xrdb -query | grep 'color4:' | awk '{print $NF}')"
magenta="$(xrdb -query | grep 'color5:' | awk '{print $NF}')"
cyan="$(xrdb -query | grep 'color6:' | awk '{print $NF}')"
white="$(xrdb -query | grep 'color7:' | awk '{print $NF}')"
grey="$(xrdb -query | grep 'color8:' | awk '{print $NF}')"
shade="$(xrdb -query | grep 'shade07:' | awk '{print $NF}')"

# vim:ft=sh
