# Workspaces
bspc monitor eDP-1 --reset-desktops 1 2 3

alias wm='bspc config'

# Window settings
wm border_width 4
wm window_gap 10
wm top_padding 0

source "$XDG_CONFIG_HOME/bspwm/theme.zsh"
wm normal_border_color "$shade"
wm focused_border_color "$black"
wm active_border_color "$magenta"
wm presel_feedback_color "$blue"

wm split_ratio 0.5
wm borderless_monocle false
wm gapless_monocle false
wm borderless_singleton false

unalias wm

# vim:ft=zsh:number:nowrap
