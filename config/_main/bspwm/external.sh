#!/bin/sh

# external_rules_command
# Absolute path to the command used to retrieve rule consequences. The
# command will receive the following arguments: window ID, class name,
# instance name, and intermediate consequences. The output of that
# command must have the following format: key1=value1 key2=value2 ...
# (the valid key/value pairs are given in the description of the rule
# command).

id="${1?}" \
	instance="$3" \
	class="$2"

case "$class" in
foo)
	bar
	;;
"")
	unset -v _NET_WM_PID
	. /dev/fd/0 2>/dev/null <<IN
        : \"\${$(
		xprop \
			-id "$id" \
			-notype \
			-f _NET_WM_PID 32c '=$0' \
			_NET_WM_PID
	)}\";
IN
	case "$(ps -p "${_NET_WM_PID:?}" -o comm= 2>/dev/null)" in
	spotify)
		echo desktop=^5
		;;
	esac
	;;
esac

# vim:filetype=sh
