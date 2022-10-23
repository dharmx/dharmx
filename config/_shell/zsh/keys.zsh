bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -s '^K' 'ls^M'
bindkey -s '^o' '_smooth_fzf^M'
bindkey -s '^A' 'br^M'
bindkey '^F' autosuggest-accept
bindkey -a 'F' history-incremental-pattern-search-forward
bindkey -a 'f' history-incremental-pattern-search-backward 
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward

# prepend sudo on the current commmand
bindkey -M emacs '' _sudo_command_line
bindkey -M vicmd '' _sudo_command_line
bindkey -M viins '' _sudo_command_line

# fix backspace and other stuff in vi-mode
bindkey -M viins '\e/' _vi_search_fix
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^U' backward-kill-line
bindkey '^P' _toggle-right-prompt
bindkey '^Y' _toggle-left-prompt

# vim:ft=zsh:nowrap
