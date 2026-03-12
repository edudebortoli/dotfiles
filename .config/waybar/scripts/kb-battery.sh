#!/bin/bash

# Replace this with your Sofle's MAC address found earlier
MAC="F9:E4:76:57:A8:EC"

# Check if connected
CONNECTED=$(bluetoothctl info "$MAC" | grep "Connected: yes")

if [ -n "$CONNECTED" ]; then
    # Extract percentage using upower (more reliable for bar output)
    # We search for the device matching your MAC
    BATT=$(upower -e | grep "keyboard_hid_${MAC//:/_}" | xargs upower -i | grep percentage | awk '{print $2}' | tr -d '%')
    
    if [ -n "$BATT" ]; then
        # Output JSON for Waybar
        echo "{\"text\": \"  $BATT%\", \"tooltip\": \"Sofle Keyboard: $BATT%\", \"class\": \"connected\"}"
    fi
else
    # Output nothing so the module hides
    echo ""
fi
