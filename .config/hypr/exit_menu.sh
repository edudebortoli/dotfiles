#!/bin/bash

choice=$(printf "Logout\nReboot\nShutdown\nWaybar" | wofi --dmenu --prompt "Exit Menu:")

case "$choice" in
    Logout)
        hyprctl dispatch exit
        ;;
    Reboot)
        systemctl reboot
        ;;
    Shutdown)
        systemctl poweroff
        ;;
    Waybar)
				pkill -f waybar && waybar >/dev/null 2>&1 &                                                                                                                                                                                                                      │
        ;;

esac
