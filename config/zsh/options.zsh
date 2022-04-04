umask 022

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

zmodload zsh/zle
zmodload zsh/zpty
zle -N sudo-command-line

export HISTFILE="$XDG_CONFIG_HOME/zsh/.zhistory"
export HISTSIZE=10000
export SAVEHIST=10000

setopt NOTIFY
setopt NOHUP
setopt MAILWARN

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_NO_FUNCTIONS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# vim:ft=zsh:nowrap
