#!/usr/bin/env bash

# cache paths by "ls path/to/files/* > a_text_file.txt"

line_count () {
    echo -n $(wc -l < "$1")
}

random_line () {
    echo -n $(shuf -i1-$(line_count $1) -n1)
}

random_path () {
    echo $(sed -n $(random_line "$1")p "$1")
}

echo -n $(random_path "$1")

