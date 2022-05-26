typeset -g foreground="$(xrdb -query | grep 'foreground:'| awk '{print $NF}')"
typeset -g background="$(xrdb -query | grep 'background:'| awk '{print $NF}')"
typeset -g black="$(xrdb -query | grep 'color0:'| awk '{print $NF}')"
typeset -g red="$(xrdb -query | grep 'color1:'| awk '{print $NF}')"
typeset -g green="$(xrdb -query | grep 'color2:'| awk '{print $NF}')"
typeset -g yellow="$(xrdb -query | grep 'color3:'| awk '{print $NF}')"
typeset -g blue="$(xrdb -query | grep 'color4:'| awk '{print $NF}')"
typeset -g magenta="$(xrdb -query | grep 'color5:'| awk '{print $NF}')"
typeset -g cyan="$(xrdb -query | grep 'color6:'| awk '{print $NF}')"
typeset -g white="$(xrdb -query | grep 'color7:'| awk '{print $NF}')"
typeset -g grey="$(xrdb -query | grep 'color8:'| awk '{print $NF}')"
typeset -g shade="$(xrdb -query | grep 'shade07:' | awk '{print $NF}')"

# vim:ft=zsh
