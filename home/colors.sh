# Colors
color0='#2e3440'
color8='#434C5E'
color1='#BF616A'
color9='#D08770'
color2='#A3BE8C'
color10='#A3BE8C'
color3='#EBCB8B'
color11='#EBCB8B'
color4='#5E81AC'
color12='#81A1C1'
color5='#B48EAD'
color13='#B48EAD'
color6='#88C0D0'
color14='#8FBCBB'
color7='#d8dee9'
color15='#ECEFF4'

# FZF colors
export FZF_DEFAULT_OPTS="
    $FZF_DEFAULT_OPTS
    --color fg:$color7,bg:$color0,hl:$color1,fg+:$color0,bg+:$color12,hl+:$color5
    --color info:$color2,prompt:$color12,spinner:$color12,pointer:$color3,marker:$color3
"

# Fix LS_COLORS being unreadable.
export LS_COLORS="${LS_COLORS}:su=30;41:ow=30;42:st=30;44:"
