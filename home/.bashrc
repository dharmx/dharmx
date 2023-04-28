files=("env" "theme" "alias" "utils" "opts" "prompt")
for file in "${files[@]}"; do source "$HOME/.config/bash/$file.bash"; done
files=""

greet="cl"
greet_path="$HOME/.bin/eyecandy/$greet"
[ -f "$greet_path" ] && eval "$greet_path" || _default_greeter
greet_path=""
greet=""

# source "$HOME/.config/broot/launcher/bash/br"
