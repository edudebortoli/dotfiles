#!/bin/bash

choice=$(printf "Logout\nReboot\nShutdown" | wofi --dmenu --prompt "Exit Menu:")

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
esac
