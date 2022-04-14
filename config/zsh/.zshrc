source "$HOME/.cargo/env"
source "$HOME/.scripts/base/colors.sh"

files=("utils" "opts" "alias" "plugs" "keys" "prompt")
for file in $files[*]; do source "$ZDOTDIR/$file.zsh"; done
unset files
eval "$HOME/.scripts/misc/bloks b; echo"

# vim:ft=zsh:nowrap
