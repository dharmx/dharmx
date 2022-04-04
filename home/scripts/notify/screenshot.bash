#!/usr/bin/env bash
# shellcheck disable=1091

source "$HOME/.scripts/notify/factory.bash"

SAVEPATH="$XDG_PICTURES_DIR/screenshot-$(date +%s).png"

case "$1" in
--selected)
	maim --select "$SAVEPATH"
	screenshot "$SAVEPATH" "Screenshot Saved" "Your screenshot has been saved to ~/Pictures"
	;;
--fullscreen)
	maim "$SAVEPATH"
	screenshot "$SAVEPATH" "Screenshot Saved" "Your screenshot has been saved to ~/Pictures"
	;;
--xclip-cropped)
	maim --select | xclip -selection clipboard -t image/png
	screenshot "notepad" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
	;;
--xclip-fullscreen)
	maim | xclip -selection clipboard -t image/png
	screenshot "notepad" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
	;;
*)
	echo "No such option!"
	;;
esac

# vim:ft=sh:nowrap
