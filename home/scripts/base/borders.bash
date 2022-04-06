#!/usr/bin/env bash
#  double borders
# needs chwb2 from wmutils/opt

outer='0x101317'   # outer
inner1='0x79dcaa'  # focused
inner2='0xf87070'  # normal

trap 'bspc config border_width 0; kill -9 -$$' INT TERM

targets() {
	case $1 in
		focused) bspc query -N -n .local.focused.\!fullscreen;;
		normal)  bspc query -N -n .\!focused.\!fullscreen
	esac
}
bspc config border_width 20

draw() { chwb2 -I "$inner" -O "$outer" -i "3" -o "12" $*; }

# initial draw, and then subscribe to events
{ echo; bspc subscribe node_geometry node_focus; } |
	while read -r _; do
		[ "$v" ] || v='abcdefg'
		inner=$inner1 draw $(targets focused)
		inner=$inner2 draw $(targets  normal)
	done
