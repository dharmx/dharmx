#!/usr/bin/env bash
#  double borders
# needs chwb2 from wmutils/opt

outer='0x101317'   # outer
inner1='0x1A1B23'  # focused
inner2='0x171821'  # normal

trap 'bspc config border_width 0; kill -9 -$$' INT TERM

targets() {
	case $1 in
		focused) bspc query -N -n .local.focused.\!fullscreen;;
		normal)  bspc query -N -n .\!focused.\!fullscreen
	esac
}
bspc config border_width 20

draw() { chwb2 -I "$inner" -O "$outer" -i "5" -o "15" $*; }

# initial draw, and then subscribe to events
{ echo; bspc subscribe node_geometry node_focus; } |
	while read -r _; do
		[ "$v" ] || v='abcdefg'
		inner=$inner1 draw $(targets focused)
		inner=$inner2 draw $(targets  normal)
	done
