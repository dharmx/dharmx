#!/usr/bin/env bash
# shellcheck disable=1091,2154

bspc monitor eDP-1 --reset-desktops 1 2 3

bspc config border_width 4
bspc config window_gap 10
bspc config top_padding 0

source "$XDG_CONFIG_HOME/bspwm/theme.bash"
bspc config normal_border_color "$shade"
bspc config focused_border_color "$black"
bspc config active_border_color "$magenta"
bspc config presel_feedback_color "$blue"

bspc config split_ratio 0.5
bspc config mapping_events_count -1

bspc config borderless_monocle false
bspc config gapless_monocle false
bspc config borderless_singleton false
bspc config single_monocle false
bspc config center_pseudo_tiled true
bspc config presel_feedback true

bspc config honor_size_hints true 
bspc config remove_disabled_monitors true
bspc config removal_adjustment true
bspc config remove_unplugged_monitors true
bspc config merge_overlapping_monitors true

bspc config automatic_scheme alternate;
bspc config initial_polarity second_child
bspc config directional_focus_tightness high

bspc config top_monocle_padding 0;
bspc config right_monocle_padding 0;
bspc config bottom_monocle_padding 0;
bspc config left_monocle_padding 0;

bspc config pointer_motion_interval 15
bspc config pointer_modifier mod4
bspc config pointer_action1 move
bspc config pointer_action2 resize_side
bspc config pointer_action3 resize_corner
bspc config click_to_focus button1
bspc config swallow_first_click true
bspc config focus_follows_pointer false
bspc config pointer_follows_focus false
bspc config pointer_follows_monitor true

bspc config ignore_ewmh_focus false
bspc config ignore_ewmh_fullscreen none
bspc config ignore_ewmh_struts false

bspc config external_rules_command "$XDG_CONFIG_HOME/bspwm/extern.bash"

bspc wm --record-history on

# vim:ft=zsh:number:nowrap
