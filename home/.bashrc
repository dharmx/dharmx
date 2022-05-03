[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

files=("env" "theme" "alias" "utils" "opts" "prompt")
for file in "${files[@]}"; do source "$XDG_CONFIG_HOME/bash/$file.bash"; done
files=""

greet="cl"
greet_path="$HOME/.scripts/misc/$greet"
[ -f "$greet_path" ] && eval "$greet_path" || _default_greeter
greet_path=""
greet=""
