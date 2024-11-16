#!/bin/bash

file=$1               # fzf search result
image_preview=$2      # preview method
tmp_img=$3            # location to place extracted image from file
tmp_ueberzug_file=$4  # file to send ueberzug commands
img=""                # location of final image

CACHE="$XDG_CACHE_HOME/links"
[[ ! -d "$CACHE" ]] && mkdir "$CACHE"

# File type handling
if [[ "$file" == "https://spankbang"* ]]; then
    read code < <(echo "$file" | rg -oP '(?<=https://spankbang.com/)[^/]+')
    save_file="$CACHE/$code"
    [[ ! -f "$save_file" ]] && cov "$file" "$save_file" new
    img="$save_file"
else
    type=$(file --dereference -b --mime-type "$file")
    if [[ -d "$file" ]]; then  # directory
        ls --color "$file"
    elif [[ "$type" == "image/vnd.djvu" ]]; then
        ddjvu -format=tiff -page=1 "$file" "$tmp_img"
        img="$tmp_img"
    elif [[ "${type:0:5}" == "image" ]]; then
        img="$file"
    elif [[ "${type:0:5}" == "audio" ]]; then
        ffmpeg -y -i "$file" -an -c:v copy "$tmp_img.jpg" 2> /dev/null
        [[ $? == 0 ]] && mv "$tmp_img.jpg" "$tmp_img" && img="$tmp_img"
        [[ $? != 0 ]] && exiftool "$file"
    elif [[ "${type:0:5}" == "video" ]]; then
        ffmpegthumbnailer -i "$file" -o "$tmp_img" -s 0 -m 2> /dev/null
        img="$tmp_img"
    elif [[ "$type" == "application/pdf" ]]; then
        pdftoppm -singlefile -jpeg "$file" "$tmp_img" 2> /dev/null
        mv "$tmp_img.jpg" "$tmp_img" && img="$tmp_img"
    elif [[ $type == *"epub"* ]]; then
        epub-thumbnailer "$file" "$tmp_img" "1440"
        img="$tmp_img"
    elif [[ "${type:0:4}" == "text" ]]; then
        if command -v bat > /dev/null; then
            bat --color always "$file"
        else
            cat "$file"
        fi
    else
        file "$file" | fold -sw $((FZF_PREVIEW_COLUMNS - 1))
    fi
fi

# Definitions of preview methods
kitty_preview()  {
    kitty icat --clear --stdin=no --transfer-mode=memory --unicode-placeholder \
        --scale-up --place="$((FZF_PREVIEW_COLUMNS))x$((FZF_PREVIEW_LINES))@0x0" "$1"
}

ueberzug_preview()  {
    echo '{"action": "add", "identifier": "fzf", "x": '"$FZF_PREVIEW_LEFT"', "y": '"$FZF_PREVIEW_TOP"', "max_width": '"$FZF_PREVIEW_COLUMNS"', "max_height": '"$FZF_PREVIEW_LINES"', "path": '"\"$1\""'}' >> "$tmp_ueberzug_file"
}

chafa_preview()  {
    chafa -s "$((FZF_PREVIEW_COLUMNS))x$((FZF_PREVIEW_LINES))" "$1"
}

catimg_preview()  {
    img_width=$(identify "$1" | grep -Eo " [[:digit:]]+ *x *[[:digit:]]+ " \
                              | grep -Eo " [[:digit:]]+")
    img_height=$(identify "$1" | grep -Eo " [[:digit:]]+ *x *[[:digit:]]+ " \
                               | grep -Eo "[[:digit:]]+ ")
    if ((2 * FZF_PREVIEW_COLUMNS * img_height > 5 * img_width * \
        FZF_PREVIEW_LINES)); then
        catimg -r 2 -H "$((2 * FZF_PREVIEW_LINES))" "$1"
    else
        catimg -r 2 -w "$((2 * FZF_PREVIEW_COLUMNS))" "$1"
    fi
}

no_image_preview()  {
    file "$file" | fold -sw $((FZF_PREVIEW_COLUMNS - 1))
}

# Show image
if [[ "$img" != "" ]]; then
    "$image_preview" "$img"
elif command -v ueberzug > /dev/null; then
    echo '{"action": "remove", "identifier": "fzf"}' >> "$tmp_ueberzug_file"
elif [[ $KITTY_WINDOW_ID ]]; then
    kitty icat --clear
fi
