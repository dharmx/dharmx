#!/usr/bin/env bash

PICOM_DIR="$XDG_CONFIG_HOME/picom"
CURRENT_CONFIG="$PICOM_DIR/current_config"
RESTORE="$(/usr/bin/cat $CURRENT_CONFIG)"

kill_picom() {
  if [[ "$(pidof picom)" != "" ]]; then
    pkill picom
    dunstify -a "picom" -i "computer-screen-off" "Picom" "The compositer is now disabled. Press Super + Slash to enable it again."
  fi
}

case "$1" in
  --max-noradius-noshadow)
    kill_picom
    sleep 1
    picom --config "$PICOM_DIR/configs/picom-max-noradius-noshadow.ini" &
    echo "max-noradius-noshadow" > "$CURRENT_CONFIG"
    ;;
  --max-noshadow)
    kill_picom
    sleep 1
    picom --config "$PICOM_DIR/configs/picom-max-noshadow.ini" &
    echo "max-noshadow" > "$CURRENT_CONFIG"
    ;;
  --max)
    kill_picom
    sleep 1
    picom --config "$PICOM_DIR/configs/picom-max.ini" &
    echo "max" > "$CURRENT_CONFIG"
    ;;
  --min)
    kill_picom
    sleep 1
    picom --config "$PICOM_DIR/configs/picom-minimal.ini" &
    echo "min" > "$CURRENT_CONFIG"
    ;;
  --opaque)
    kill_picom
    sleep 1
    picom --config "$PICOM_DIR/configs/picom-opaque.ini" &
    echo "opaque" > "$CURRENT_CONFIG"
    ;;
  --min-opaque)
    kill_picom
    sleep 1
    picom --config "$PICOM_DIR/configs/picom-min-opaque.ini" &
    echo "min-opaque" > "$CURRENT_CONFIG"
    ;;
  --restore)
    kill_picom
    sleep 1
    picom --config "$PICOM_DIR/configs/picom-$RESTORE.ini" &
    ;;
  --kill)
    kill_picom
    ;;
  --toggle)
    if [[ "$(pidof picom)" != "" ]]; then
      dunstify -a "picom" -i "computer-screen-off" "Picom" "The compositer is now disabled. Press Super + Slash to enable it again."
      pkill picom
    else
      picom --config "$PICOM_DIR/configs/picom-$RESTORE.ini" &
      dunstify -a "picom" -i "computer-screen-on" "Picom" "The compositer is now enabled."
      sleep 1
    fi
    ;;
  --help)
    ls -1 "$XDG_CONFIG_HOME/picom/configs"
    ;;
    *)
    echo "Option '$1' is invalid."
    ;;
esac

# vim: ft=bash
