#!/usr/bin/env bash
last_wallpaper="$HOME/.cache/last-wallpaper"
[[ -f "$last_wallpaper" ]] || exit 0
wallpaper=$(<"$last_wallpaper")

hyprctl hyprpaper preload "$wallpaper"
hyprctl hyprpaper wallpaper ",$wallpaper"
