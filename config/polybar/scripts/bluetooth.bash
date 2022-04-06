#!/usr/bin/env bash

POWERED="$(bluetoothctl show | grep Powered | awk '{print $2}')"
DEVICES="$(bluetoothctl devices | wc -l)"

toggle() {
  if [[ "$POWERED" == "no" ]]; then
    eval "bluetoothctl power on"
  else
    eval "bluetoothctl power off"
  fi
}

status() {
  if [[ "$POWERED" == "no" ]]; then
    echo " Offline"
  else
    echo " $DEVICES"
  fi
}

if [[ "$1" == "--toggle" ]]; then
  toggle
elif [[ "$1" == "--status" ]]; then
  status
fi

# vim:ft=bash:nowrap
