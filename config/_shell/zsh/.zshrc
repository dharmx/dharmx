[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f "$HOME/.config/broot/launcher/bash/br" ] && source "$HOME/.config/broot/launcher/bash/br"

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

for fun in ${(ok)functions[(I)_____*]}; do
  eval "alias ${${fun:5}//_/-}=\"${fun}\""
done

if command -v bling-xbl &>/dev/null; then
  bling-xbl
else
  _____default_greeter
fi

[[ $(command -v zoxide) ]] && eval "$(zoxide init zsh)"
[[ $(command -v fuck) ]] && eval "$(thefuck --alias)"
