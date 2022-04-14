[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

files=("theme" "env" "alias" "utils" "opts" "plugs" "keys" "prompt")
for file in $files[*]; do source "$ZDOTDIR/$file.zsh"; done
unset files

greet="alpha"
greet_path="$HOME/.scripts/misc/$greet"
[ -f "$greet_path" ] && eval "$greet_path" || _default_greeter
unset greet_path greet

# vim:ft=zsh:nowrap
