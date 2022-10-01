#!/usr/bin/env bash
# shellcheck disable=1091,2154

function wm() { bspc config "$@"; }

bspc monitor primary --reset-desktops 1 2 3

wm border_width 4
wm window_gap 8
wm top_padding 0

source "$XDG_CONFIG_HOME/bspwm/theme.bash"
wm normal_border_color "$shade"
wm focused_border_color "$black"
wm active_border_color "$magenta"
wm presel_feedback_color "$blue"

wm split_ratio 0.5
wm mapping_events_count -1

wm borderless_monocle false
wm gapless_monocle false
wm borderless_singleton false
wm single_monocle false
wm center_pseudo_tiled true
wm presel_feedback true

wm honor_size_hints true
wm remove_disabled_monitors true
wm removal_adjustment true
wm remove_unplugged_monitors true
wm merge_overlapping_monitors true

wm automatic_scheme longest_side
wm initial_polarity second_child
wm directional_focus_tightness high

wm top_monocle_padding 0;
wm right_monocle_padding 0;
wm bottom_monocle_padding 0;
wm left_monocle_padding 0;

wm pointer_motion_interval 15
wm pointer_modifier mod4
wm pointer_action1 move
wm pointer_action2 resize_side
wm pointer_action3 resize_corner
wm click_to_focus button1
wm swallow_first_click false
wm focus_follows_pointer false
wm pointer_follows_focus false
wm pointer_follows_monitor true

wm ignore_ewmh_focus false
wm ignore_ewmh_fullscreen none
wm ignore_ewmh_struts false

wm external_rules_command "$XDG_CONFIG_HOME/bspwm/extern.bash"

bspc wm --record-history on

# vim:ft=zsh:number:nowrap
