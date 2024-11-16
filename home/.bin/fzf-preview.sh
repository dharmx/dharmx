#!/bin/bash

tmp_img=$(mktemp /tmp/fzf-preview.XXXXXXXXXX)
tmp_ueberzug_file=""

# Choose image previewer
if command -v ueberzug > /dev/null; then
    image_preview="ueberzug_preview"
    # Initialize ueberzug (listen to /tmp/fzf-ueberzug.XXXXXXXXXX)
    tmp_ueberzug_file=$(mktemp /tmp/fzf-ueberzug.XXXXXXXXXX)
    if command -v ueberzugpp > /dev/null; then
        tail -f --pid=$$ $tmp_ueberzug_file 2> /dev/null | ueberzugpp layer --silent &
    else
        tail -f --pid=$$ $tmp_ueberzug_file 2> /dev/null | ueberzug layer --silent &
    fi
elif [[ $KITTY_WINDOW_ID ]]; then
    image_preview="kitty_preview"
elif command -v chafa > /dev/null; then
    image_preview="chafa_preview"
elif command -v catimg > /dev/null; then
    image_preview="catimg_preview"
else
    image_preview="no_image_preview"
fi

# Setup and run fzf
if command -v fd > /dev/null; then
    export FZF_DEFAULT_COMMAND='fd -H -t file'
fi
# Set preview command and refresh on terminal resize
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --bind resize:refresh-preview \
--preview='$(dirname "$0")/fzf-file2img.sh {} $image_preview $tmp_img $tmp_ueberzug_file'"
if command -v rifle > /dev/null; then  # ranger's file opener
    fzf --multi --bind 'enter:become(rifle {+})'
elif command -v open > /dev/null; then
    fzf --multi --bind 'enter:become(open {+})'
elif command -v xdg-open > /dev/null; then
    fzf --multi --bind 'enter:become(xdg-open {+})'
else
    fzf
fi

# Clear last image and remove temporary files
if command -v ueberzug > /dev/null; then
    echo '{"action": "remove", "identifier": "fzf"}' >> $tmp_ueberzug_file
fi
rm -f $tmp_img $tmp_ueberzug_file
