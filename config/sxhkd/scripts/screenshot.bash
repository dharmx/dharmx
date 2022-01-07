#!/usr/bin/env bash

case "$1" in
    --selected)
        maim --select "$SAVEPATH" &> /dev/null &
        wait
        dunstify -a "screenshot" -i "$XDG_PICTURES_DIR/$(date).png" "Screenshot Saved" "Your screenshot has been saved to ~/Pictures"
        ;;
    --fullscreen)
        maim "$SAVEPATH" &> /dev/null &
        wait
        dunstify -a "screenshot" -i "$XDG_PICTURES_DIR/$(date).png" "Screenshot Saved" "Your screenshot has been saved to ~/Pictures"
        ;;
    --xclip-cropped)
        maim --select | xclip -selection clipboard -t image/png &
        wait
        dunstify -a "screenshot" -i "notepad" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
        ;;
    --xclip-fullscreen)
        maim | xclip -selection clipboard -t image/png &
        wait
        dunstify -a "screenshot" -i "notepad" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
        ;;
    *)
        echo "No such option!"
        ;;
esac
# vim:ft=bash:nowrap
