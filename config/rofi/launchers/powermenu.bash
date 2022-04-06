#!/usr/bin/env bash

dir="$XDG_CONFIG_HOME/rofi/configs"
rofi_command="rofi -theme $dir/powermenu.rasi"

uptime=$(uptime -p | sed -e 's/up //g')
cpu=$(~/.config/rofi/scripts/usedcpu.bash)
memory=$(~/.config/rofi/scripts/usedram.bash)
installed=$(yay -Qd | wc -l)

# Notification icons
SHUTDOWN_ICON="$XDG_CONFIG_HOME/rofi/img/twotone_power_settings_new_white_48dp.png"
REBOOT_ICON="$XDG_CONFIG_HOME/rofi/img/twotone_restart_alt_white_48dp.png"
LOCK_ICON="$XDG_CONFIG_HOME/rofi/img/twotone_lock_white_48dp.png"
SUSPEND_ICON="$XDG_CONFIG_HOME/rofi/img/twotone_dark_mode_white_48dp.png"
LOGOUT_ICON="$XDG_CONFIG_HOME/rofi/img/twotone_input_white_48dp.png"

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""

notify_red() {
  dunstctl close
  notify-send -h "string:bgcolor:#e06c75"                    \
            -h "string:fgcolor:#ffffff"                      \
            -h "string:frcolor:#00000000"                    \
            -h "string:image-path:$1"                        \
            "$2"                                             \
            "$3"
}

# Confirmation
confirm_exit() {
    "$XDG_CONFIG_HOME"/rofi/launchers/prompt.bash
}

# Message
msg() {
    rofi -theme "$XDG_CONFIG_HOME/rofi/configs/message.rasi" -e "Available Options  -  yes / y / no / n"
}

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "  $uptime |  $cpu | ﬙ $memory |  $installed " -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
        ans=$(confirm_exit &)
        if [[ $ans == "Yup" ]]; then
          notify_red "$SHUTDOWN_ICON" "Shutting down" "Powering off your computer in 3 seconds"
          sleep 3
          poweroff 
        elif [[ $ans == "Nope" ]]; then
          exit 0
        else
          msg
        fi
    ;;
    $reboot)
        ans=$(confirm_exit &)
        if [[ $ans == "Yup" ]]; then
          notify_red "$REBOOT_ICON" "Rebooting" "Rebooting your computer in 3 seconds"
          sleep 3
          reboot
        elif [[ $ans == "Nope" ]]; then
          exit 0
        else
          msg
        fi
    ;;
    $lock)
        notify_red "$LOCK_ICON" "Locking" "Screenlocking your computer"
        sleep 2
        lock
    ;;
    $suspend)
        ans=$(confirm_exit &)
        if [[ $ans == "Yup" ]]; then
          mpc -q pause
          notify_red "$SUSPEND_ICON" "Suspending" "Your computer will go to sleep in 3 seconds"
          sleep 3
          systemctl suspend
          locklauncher
        elif [[ $ans == "Nope" ]]; then
          exit 0
        else
          msg
        fi
    ;;
    $logout)
        ans=$(confirm_exit &)
        if [[ $ans == "Yup" ]]; then
          notify_red "$LOGOUT_ICON" "Logging out" "Logging out of $(whoami) in 3 seconds"
          sleep 3
          bspc quit
        elif [[ $ans == "Nope" ]]; then
          exit 0
        else
          msg
        fi
    ;;
esac

