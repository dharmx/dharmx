# Monitor settings
pgrep -x sxhkd >/dev/null || sxhkd -c "$XDG_CONFIG_HOME/sxhkd/config.sxhkdrc" &

# Workspaces
bspc monitor -d 1 2

# Window settings
bspc config border_width 0
bspc config window_gap 10
bspc config top_padding 0

source "$HOME/.scripts/base/colors.sh"
bspc config focused_border_color "$color10"
bspc config normal_border_color "$color4"
bspc config presel_border_color "$color2"
bspc config presel_feedback_color "$color6"
bspc config urgent_border_color "$color3"
bspc config focused_private_border_color "$color1"

"$HOME"/.scripts/base/borders.bash &

bspc config split_ratio 0.5
bspc config borderless_monocle true
bspc config gapless_monocle true

# removed default rules
# bspc rule -r *:*

# Program settings
bspc rule -a Screenkey manage=off
bspc rule -a Gimp desktop='^8' state=floating follow=on
bspc rule -a Chromium desktop='^2'
bspc rule -a mplayer2 state=floating
bspc rule -a mpv state=floating
bspc rule -a Kupfer.py focus=on
bspc rule -a Screenkey manage=off
bspc rule -a spotify='^5'
bspc rule -a spotify state=pseudo_tiled
bspc rule -a TelegramDesktop desktop='^4'
bspc rule -a Firefox desktop='^2'
bspc rule -a Zathura state=floating
bspc rule -a conky sticky=off manage=off lower=on
bspc rule -a lxappearance state=floating center=true
bspc rule -a tilda state=floating center=true border=off sticky=on
bspc rule -a tilix state=floating center=true border=off sticky=on
bspc rule -a feh state=floating floating=true manage=on center=true
bspc rule -a Gpick state=floating floating=true manage=on center=true
bspc rule -a jgmenu manage=off floating=true state=floating
bspc rule -a Pavucontrol state=floating center=true
bspc rule -a kitty state=tiled floating=false center=true
bspc rule -a Peek state=floating floating=true center=true
bspc rule -a ksnip state=floating floating=true center=true
bspc rule -a blueman-manager state=floating floating=true center=true
bspc rule -a Blueman-manager state=floating floating=true center=true
bspc rule -a blueman-adapters state=floating floating=true center=true
bspc rule -a Blueman-adapters state=floating floating=true center=true
bspc rule -a Arandr state=floating floating=true center=true

# vim:ft=zsh:number:nowrap
