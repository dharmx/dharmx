#!/usr/bin/env bash

LEVEL0="$XDG_CONFIG_HOME/i3/images/brightness/twotone_brightness_1_black_48dp.png"
LEVEL1="$XDG_CONFIG_HOME/i3/images/brightness/twotone_brightness_2_black_48dp.png"
LEVEL2="$XDG_CONFIG_HOME/i3/images/brightness/twotone_brightness_3_black_48dp.png"
LEVEL3="$XDG_CONFIG_HOME/i3/images/brightness/twotone_brightness_4_black_48dp.png"
LEVEL4="$XDG_CONFIG_HOME/i3/images/brightness/twotone_brightness_5_black_48dp.png"
LEVEL5="$XDG_CONFIG_HOME/i3/images/brightness/twotone_brightness_6_black_48dp.png"
LEVEL6="$XDG_CONFIG_HOME/i3/images/brightness/twotone_brightness_7_black_48dp.png"
LEVEL7="$XDG_CONFIG_HOME/i3/images/brightness/twotone_light_mode_black_48dp.png"
LEVEL8="$XDG_CONFIG_HOME/i3/images/brightness/twotone_flare_black_48dp.png"
LEVEL9="$XDG_CONFIG_HOME/i3/images/brightness/twotone_new_releases_black_48dp.png"
LEVEL_OFF="$XDG_CONFIG_HOME/i3/images/brightness/twotone_visibility_off_white_48dp.png"
LEVEL_VERY_LOW="$XDG_CONFIG_HOME/i3/images/brightness/twotone_visibility_white_48dp.png"

notify_template() {
	dunstify -u "$1" \
		-i "$2" \
		"$3" \
		"$4"
}
#1e222a#e06c75
notify_template_very_low() {
	FRAME="string:frcolor:#00000000"
	notify-send -h "$1" \
		-h "$2" \
		-h "$FRAME" \
		-i "$3" \
		"$4" \
		"$5"
}

notify() {
	if [[ "$1" == "-I" ]]; then
		xbacklight -inc 1
	elif [[ "$1" == "-D" ]]; then
		xbacklight -dec 1
	else
		echo "${red}Invalid Command!"
		exit 1
	fi

	BRIGHTNESS=$(xbacklight -get)
	case ""$BRIGHTNESS in
	100) notify_template "critical" """$LEVEL9" " Brightness Warning!" "100% brightness is not recommended" ;;
	90) notify_template "critical" """$LEVEL8" " Brightness" "90% brightnes is not recommended" ;;
	80) notify_template "normal" """$LEVEL7" "Brightness" "Brightness changed to 80%" ;;
	70) notify_template "normal" """$LEVEL6" "Brightness" "Brightness changed to 70%" ;;
	60) notify_template "normal" """$LEVEL5" "Brightness" "Brightness changed to 60%" ;;
	50) notify_template "normal" """$LEVEL4" "Brightness" "Brightness changed to 50%" ;;
	40) notify_template "normal" """$LEVEL3" "Brightness" "Brightness changed to 40%" ;;
	30) notify_template "low" """$LEVEL2" "Brightness" "Brightness changed to 30%" ;;
	20) notify_template "low" """$LEVEL1" "Brightness" "Brightness changed to 20%" ;;
	10) notify_template "low" """$LEVEL0" "Brightness" "Brightness changed to 10%" ;;
	1) notify_template_very_low "string:bgcolor:#e06c75" "string:fgcolor:#fff" "$LEVEL_VERY_LOW" " Brightness Warning!" "1% brightness is not recommended" ;;
	0) notify_template_very_low "string:bgcolor:#5C6370" "string:fgcolor:#fff" "$LEVEL_OFF" "Brightness" "Screen is offline" ;;
	esac
}

notify "$1"
