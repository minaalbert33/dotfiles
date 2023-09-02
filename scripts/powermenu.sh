#!/bin/bash

# Outputting choices to rofi in dmenu mode
choice=$(echo -e "exit\npoweroff\nreboot\nsuspend\nhibernate\n" | rofi -dmenu "Choose action: ")

case "$choice" in
	"poweroff") poweroff ;;
	"reboot") reboot ;;
	"suspend") systemctl suspend-then-hibernate ;;
	"hibernate") systemctl hibernate ;;
	*) exit 1 ;;
esac
