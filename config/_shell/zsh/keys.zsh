bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -s '^K' 'ls^M'
bindkey -s '^O' '_____smooth_fzf^M'
bindkey -s '^A' 'fm^M'
bindkey '^F' autosuggest-accept
bindkey -a 'F' history-incremental-pattern-search-forward
bindkey -a 'f' history-incremental-pattern-search-backward 
bindkey -a 'k' history-beginning-search-backward
bindkey -a 'j' history-beginning-search-forward

# prepend sudo on the current commmand
bindkey -M emacs '' _____sudo_command_line
bindkey -M vicmd '' _____sudo_command_line
bindkey -M viins '' _____sudo_command_line

# fix backspace and other stuff in vi-mode
bindkey -M viins '\e/' _____vi_search_fix
bindkey '^P' _____toggle_right_prompt
bindkey '^Y' _____toggle_left_prompt

bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^U' backward-kill-line

# vim:ft=zsh:nowrap
