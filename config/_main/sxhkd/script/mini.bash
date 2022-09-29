#!/usr/bin/env bash
# Minimize and Maximize nodes

ROFI_ITEMS=
INDICES=()
PADDING="    "

function get_attrs() {
  while read -r node_id; do
    desktop_name="$(xdotool get_desktop_for_window "$node_id" 2> /dev/null)"
    class_name="$(xdotool getwindowclassname "$node_id" 2> /dev/null)"
    node_name="$(xdotool getwindowname "$node_id" 2> /dev/null)"

    [ "$desktop_name" ] || continue
    INDICES+=("$node_id")
    ROFI_ITEMS+="$desktop_name$PADDING$class_name$PADDING$node_name\n"
  done < <(bspc query --nodes --node ".$1")
}

case "$1" in
  --unhide | -x)
    get_attrs "hidden"

    null="$(echo "$ROFI_ITEMS" | tr --delete '\t\n ')"
    [ "$null" ] || {
      notify-send -a layouts -u critical -i custom-cancel Maximize 'No hidden windows open!'
      exit 1
    }

    read -r index < <(echo -e "$ROFI_ITEMS" | rofi -format 'i' -dmenu -p MiniSL)

    [ "$index" ] || {
      notify-send -a layouts -u critical -i custom-cancel Maximize 'Selection Cancelled.'
      exit 1
    }

    eval "bspc node ${INDICES[$index]} --flag hidden=off"
    echo "hidden=off node=${INDICES[$index]}"
    ;;
  --hide | -c)
    get_attrs "!hidden"

    null="$(echo "$ROFI_ITEMS" | tr --delete '\t\n ')"
    [ "$null" ] || {
      notify-send -a layouts -u critical -i custom-cancel Minimize 'No windows open!'
      exit 1
    }

    read -r index < <(echo -e "$ROFI_ITEMS" | rofi -format 'i' -dmenu -p MiniSL)

    [ "$index" ] || {
      notify-send -a layouts -u critical -i custom-cancel Minimize 'Selection Cancelled.'
      exit 1
    }

    eval "bspc node ${INDICES[$index]} --flag hidden=on"
    echo "hidden=on node=${INDICES[$index]}"
    ;;
  *) echo -e "$(tput setb 1) $(tput setf 0)INFO \e[0m mini {--unhide|-x,--hide|-c}" ;;
esac

unset ROFI_ITEMS INDICES PADDING desktop_name node_name class_name node_id

# vim:filetype=sh
