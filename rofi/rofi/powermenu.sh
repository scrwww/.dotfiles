#!/bin/bash

theme="kanso-rofi"
dir="$HOME/.config/rofi"
rofi_command="rofi -theme $dir/$theme -no-fixed-num-lines -run-command '{cmd}'"

shutdown="Shutdown"
reboot="Reboot"
logout="Logout"

confirm_exit() {
	confirm=$(printf "No\nYes" | $rofi_command -dmenu -i -lines 2 -p "Are You Sure?")

	[[ "$confirm" == "Yes" ]]
}

options="$shutdown\n$reboot\n$logout\n$lock\n$suspend"
uptime=$(uptime -p | sed -e 's/up //g')

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -lines 4 -selected-row 2)"
case $chosen in
    	$shutdown)
		if confirm_exit; then
			systemctl poweroff
		fi
        ;;
    	$reboot)
		if confirm_exit; then
			systemctl reboot
		fi
        ;;
	$logout)
		if confirm_exit; then
                        hyprctl dispatch exit
		fi
	;;
esac
