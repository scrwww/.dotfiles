#!/bin/bash

LOCK_TIMEOUT=30
sleep 2

HYPRLOCK_PID=$(pgrep -x hyprlock)

if [ -n "$HYPRLOCK_PID" ]; then
    sleep "$LOCK_TIMEOUT"
    if ps -p "$HYPRLOCK_PID" > /dev/null; then
        systemctl suspend
    fi
fi

