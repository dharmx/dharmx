export PATH="$PATH:$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.local/bin"

source "$HOME/.scripts/base/colors.sh"

source "$XDG_CONFIG_HOME/zsh/utils.zsh"
source "$XDG_CONFIG_HOME/zsh/options.zsh"
source "$XDG_CONFIG_HOME/zsh/prompt.zsh"
source "$XDG_CONFIG_HOME/zsh/alias.zsh"
source "$XDG_CONFIG_HOME/zsh/plugs.zsh"
source "$XDG_CONFIG_HOME/zsh/keys.zsh"

eval "$HOME/.scripts/misc/panes-nord; echo"

# vim:ft=zsh:nowrap
