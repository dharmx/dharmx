[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"
[ $(command -v fuck) ] && eval $(thefuck --alias)

while read file
do 
  source "$ZDOTDIR/$file.zsh"
done <<-EOF
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

if command -v bling-xbl &>/dev/null; then
  bling-xbl
else
  _____default_greeter
fi
