#!/usr/bin/env bash
last_wallpaper="$HOME/.cache/last-wallpaper"
[[ -f "$last_wallpaper" ]] || exit 0
wallpaper=$(<"$last_wallpaper")

monitor=$(hyprctl monitors | grep Monitor | awk '{print $2}')
hyprctl hyprpaper preload "$wallpaper"
hyprctl hyprpaper wallpaper "$monitor,$wallpaper"
