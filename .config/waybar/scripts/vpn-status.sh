#!/bin/bash

# Check if FortiClient VPN is connected
# This checks if the VPN interface is up
if ip link show | grep -q "ppp0\|tun0\|vpn"; then
    echo '{"text": "\uf023", "class": "connected", "tooltip": "VPN Connected"}'
elif pgrep -x "forticlient" > /dev/null || pgrep -f "fortivpn" > /dev/null; then
    echo '{"text": "\ueb74", "class": "disconnected", "tooltip": "VPN Disconnected"}'
else
    echo '{"text": "\ueb74", "class": "disconnected", "tooltip": "VPN Disconnected"}'
fi
