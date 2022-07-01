#!/usr/bin/env bash

wm_config=(
	border_width
	window_gap
	top_padding
	normal_border_color
	focused_border_color
	active_border_color
	presel_feedback_color
	split_ratio
	mapping_events_count
	borderless_monocle
	gapless_monocle
	borderless_singleton
	single_monocle
	center_pseudo_tiled
	presel_feedback
	honor_size_hints
	remove_disabled_monitors
	removal_adjustment
	remove_unplugged_monitors
	merge_overlapping_monitors
	automatic_scheme
	initial_polarity
	directional_focus_tightness
	top_monocle_padding
	right_monocle_padding
	bottom_monocle_padding
	left_monocle_padding
	pointer_motion_interval
	pointer_modifier
	pointer_action1
	pointer_action2
	pointer_action3
	click_to_focus
	swallow_first_click
	focus_follows_pointer
	pointer_follows_focus
	pointer_follows_monitor
	ignore_ewmh_focus
	ignore_ewmh_fullscreen
	ignore_ewmh_struts
)

function get_json() {
  local primed="{"
  for option in "${wm_config[@]}"; do
    primed+="\"$option\":\"$(bspc config "$option")\","
  done && primed="${primed::-1}" && primed+="}" && echo "$primed"
}

function subscribe() {
  local old new
  old="$(get_json)"
  while sleep "$1"; do
    new="$(get_json)"
    if [[ "$old" != "$new" ]]; then
      eval "$2"
      old="$new"
    fi
  done
}

case "$1" in
  --json|-j) get_json;;
  --sub-json|-sj) subscribe "$2" 'get_json';;
  --sub|-s) [[ "$3" == "" ]] && subscribe "$2" 'echo Ping!' || subscribe "$2" "$3";;
  *) echo "LOL";;
esac

# vim:filetype=sh
