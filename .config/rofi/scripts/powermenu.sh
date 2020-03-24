#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme themes/powermenu.rasi"
uptime=$(uptime | cut -d' ' -f 2)

# Options
shutdown=""
reboot="⟳"
lock="🔒"
suspend="💤"
logout=""

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "UP - $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        i3lock-fancy
        ;;
    $suspend)
        amixer set Master mute
        i3lock-fancy
        systemctl suspend
        ;;
    $logout)
        i3-msg exit
        ;;
esac

