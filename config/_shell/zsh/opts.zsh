YTFZF_CONFIG_DIR="$HOME/.config/ytfzf"
YTFZF_CONFIG_FILE="$YTFZF_CONFIG_DIR/conf.sh"

umask 022
zmodload zsh/zle
zmodload zsh/zpty
zmodload zsh/complist

autoload _____vi_search_fix
autoload -Uz colors
autoload -U compinit
colors

zle -N _____vi_search_fix
zle -N _____sudo_command_line
zle -N _____toggle_right_prompt
zle -N _____toggle_left_prompt

# adapted from https://github.com/marlonrichert/zsh-autocomplete
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# zstyle ":completion:*" sort false
# zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
# zstyle ":completion:*" special-dirs true
# zstyle ":completion:*" ignored-patterns
# zstyle ":completion:*" completer _complete

# zstyle ':autocomplete:*' default-context ''
# zstyle ':autocomplete:*' min-delay 0.05
# zstyle ':autocomplete:*' min-input 1
# zstyle ':autocomplete:*' ignored-input ''
# zstyle ':autocomplete:*' list-lines 16
# zstyle ':autocomplete:history-search:*' list-lines 16
# zstyle ':autocomplete:history-incremental-search-*:*' list-lines 16
# zstyle ':autocomplete:*' recent-dirs cdr
# zstyle ':autocomplete:*' insert-unambiguous no
# zstyle ':autocomplete:*' widget-style complete-word
# zstyle ':autocomplete:*' fzf-completion no
# zstyle ':autocomplete:*' add-space executables aliases functions builtins reserved-words commands

zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':fzf-tab:complete:*:*' fzf-preview 'preview $realpath'
zstyle ':fzf-tab:*' switch-group ',' '.'
zstyle ':fzf-tab:*' fzf-min-height 100

HISTFILE="$HOME/.cache/zsh/.zhistory"
HISTORY_IGNORE="(echo *|printf *|print *|ls|fm)"
HISTSIZE=10000
SAVEHIST=10000

ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$color8,bold"

while read -r option
do 
  setopt $option
done <<-EOF
AUTOCD
AUTO_MENU
PUSHDSILENT
AUTOPUSHD
PUSHDMINUS
AUTO_PARAM_SLASH
COMPLETE_IN_WORD
NO_MENU_COMPLETE
HASH_LIST_ALL
ALWAYS_TO_END
NOTIFY
NOHUP
MAILWARN
INTERACTIVE_COMMENTS
NOBEEP
APPEND_HISTORY
SHARE_HISTORY
INC_APPEND_HISTORY
EXTENDED_HISTORY
HIST_IGNORE_ALL_DUPS
HIST_IGNORE_SPACE
HIST_NO_FUNCTIONS
HIST_EXPIRE_DUPS_FIRST
HIST_SAVE_NO_DUPS
HIST_REDUCE_BLANKS
EOF

while read -r option
do
  unsetopt $option
done <<-EOF
FLOWCONTROL
NOMATCH
CORRECT
EQUALS
EOF

command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

## comment this out if you do not want vi-mode
bindkey -e # revert to emacs binds

# vim:filetype=zsh:nowrap
