#!/usr/bin/env bash

SAVEPATH="$XDG_PICTURES_DIR/$(date).png"
CLIPBOARD="$XDG_CONFIG_HOME/sxhkd/images/screenshot/clipboard.png"

case "$1" in 
    --selected)
        maim --select "$SAVEPATH" &> /dev/null &
        wait
        dunstify -u normal -i "$SAVEPATH" "Screenshot Saved" "Your screenshot has been saved to ~/Pictures"
        ;;
    --fullscreen)
        maim "$SAVEPATH" &> /dev/null &
        wait
        dunstify -u normal -i "$SAVEPATH" "Screenshot Saved" "Your screenshot has been saved to ~/Pictures"
        ;;
    --xclip-cropped)
        maim --select | xclip -selection clipboard -t image/png &
        wait
        dunstify -u normal -i "$CLIPBOARD" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
        ;;
    --xclip-fullscreen)
        maim | xclip -selection clipboard -t image/png &
        wait
        dunstify -u normal -i "$CLIPBOARD" "Screenshot Copied" "Your screenshot has been copied to the clipboard"
        ;;
    *)
        echo "No such option!"
        ;;
esac
