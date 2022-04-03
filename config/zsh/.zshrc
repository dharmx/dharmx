# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
    source /etc/profile.d/vte.sh
fi

source "$XDG_CONFIG_HOME/zsh/alias.zsh"
source "$HOME/.scripts/base/colors.sh"
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zmodload zsh/zle
zmodload zsh/zpty

export PATH="$PATH:$XDG_DATA_HOME/gem/ruby/3.0.0/bin:$HOME/.local/bin"

export PS2="%2F%3F "
export PS1="%6F%/ %4F%5F "

export HISTFILE="$XDG_CONFIG_HOME/zsh/.zhistory"
export HISTSIZE=10000

setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

eval "$HOME/.scripts/misc/panes-nord"; echo
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "$XDG_CONFIG_HOME/zsh/plug.zsh" ] && source "$XDG_CONFIG_HOME/zsh/plug.zsh"

# vim:ft=zsh:nowrap
