# Start keyboard daemon
pgrep -x sxhkd >/dev/null || sxhkd -c "$XDG_CONFIG_HOME/sxhkd/config.sx" &

# Workspaces
bspc monitor -d 1 2 3

# Window settings
bspc config border_width 0
bspc config window_gap 10
bspc config top_padding 0

source "$HOME/.scripts/base/colors.sh"
bspc config focused_border_color "$color10"
bspc config normal_border_color "$color4"
bspc config presel_feedback_color "$color6"

"$HOME"/.scripts/base/borders.bash &

bspc config split_ratio 0.5
bspc config borderless_monocle false
bspc config gapless_monocle false

# vim:ft=zsh:number:nowrap
