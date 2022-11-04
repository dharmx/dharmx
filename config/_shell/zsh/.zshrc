[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
source "$HOME/.config/broot/launcher/bash/br"

while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
theme
env
alias
utils
opts
plugs
keys
prompt
EOF

for fun in ${(ok)functions[(I)[_][_][_][_][_]*]}; do 
  eval "alias ${${fun:5}//_/-}=\"${fun}\""
done

greet="xbl"
greet_path="$HOME/.bin/eyecandy/$greet"
[ -f "$greet_path" ] && eval "$greet_path" || _____default_greeter
unset greet_path greet

# vim:ft=zsh:nowrap
