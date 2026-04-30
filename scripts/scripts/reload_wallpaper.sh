#!/usr/bin/env bash

# Ensure hyprpaper is running
if ! pgrep -x "hyprpaper" > /dev/null; then
    hyprpaper &
    sleep 1 # Wait for hyprpaper to initialize
fi

# Try to get the last wallpaper from cache, fallback to config if missing
last_wallpaper="$HOME/.cache/last-wallpaper"
if [[ ! -f "$last_wallpaper" ]]; then
    last_wallpaper="$HOME/.config/hypr/last-wallpaper"
fi

[[ -f "$last_wallpaper" ]] || exit 0
wall=$(<"$last_wallpaper")

# Check if the wallpaper file exists before trying to load it
if [[ -f "$wall" ]]; then
    hyprctl hyprpaper unload all          >/dev/null
    hyprctl hyprpaper preload "$wall"     >/dev/null
    hyprctl hyprpaper wallpaper ",$wall"  >/dev/null
fi
