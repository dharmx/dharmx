#!/usr/bin/env bash

shutdown=" Shutdown"
reboot=" Restart"
suspend=" Sleepmode"
logout="﫼 Logout"

case "$@" in
  "$shutdown") poweroff ;;
  "$reboot") reboot ;;
  "$suspend") systemctl suspend && exit 0 ;;
  "$logout") bspc quit ;;
esac

echo -ne "$shutdown\n$reboot\n$suspend\n$logout"

# vim:ft=bash:nowrap:number
