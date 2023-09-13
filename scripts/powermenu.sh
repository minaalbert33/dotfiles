#!/bin/bash

# Outputting choices to rofi in dmenu mode
choice=$(echo -e "exit\npoweroff\nreboot\nsuspend\nhibernate\n" | rofi -dmenu "Choose action: ")
["$choice" = "exit"] && exit 
[ "$choice" = "poweroff" ] && poweroff
[ "$choice" = "reboot" ] && reboot
[ "$choice" = "suspend" ] && systemctl suspend-then-hibernate
[ "$choice" = "hibernate" ] && systemctl hibernate
