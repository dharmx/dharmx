source "$HOME/.scripts/base/colors.sh"

source "$HOME/Dotfiles/nordfiles/home/alias.bash"
source "$HOME/Dotfiles/nordfiles/home/utils.bash"
source "$HOME/Dotfiles/nordfiles/home/prompt.bash"

if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
eval "$HOME/.scripts/misc/lil-blok; echo"
