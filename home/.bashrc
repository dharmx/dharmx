source "$HOME/Dotfiles/nordfiles/home/alias.bash"
source "$HOME/.scripts/base/colors.sh"
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
