#!/usr/bin/env bash

LAST_WALL_FILE="$HOME/.cache/last-wallpaper"
FALLBACK_WALL_FILE="$HOME/.config/hypr/last-wallpaper"

exec_detached() {
    local cmd="$1"
    if command -v swaymsg >/dev/null 2>&1 && swaymsg -t get_version >/dev/null 2>&1; then
        swaymsg exec "$cmd" >/dev/null 2>&1
    elif command -v hyprctl >/dev/null 2>&1 && hyprctl version >/dev/null 2>&1; then
        hyprctl dispatch exec "$cmd" >/dev/null 2>&1
    else
        (setsid $cmd >/dev/null 2>&1 &)
    fi
}

wall_file="$LAST_WALL_FILE"
if [[ ! -f "$wall_file" ]]; then
    wall_file="$FALLBACK_WALL_FILE"
fi

[[ -f "$wall_file" ]] || exit 0
wall=$(cat "$wall_file")

if [[ -f "$wall" ]]; then
    pkill swaybg || true
    exec_detached "swaybg -i \"$wall\" -m fill"
fi
