bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey -s '^o' '_smooth_fzf^M'

# Defined shortcut keys: [Esc] [Esc]
bindkey -M emacs '\e\e' sudo-command-line
bindkey -M vicmd '\e\e' sudo-command-line
bindkey -M viins '\e\e' sudo-command-line

# vim:ft=zsh:nowrap
