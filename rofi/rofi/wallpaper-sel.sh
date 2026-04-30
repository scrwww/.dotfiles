#!/usr/bin/env bash

mode_script=~/.config/rofi/wallpaper.sh
dir=$HOME/.config/rofi
theme=kanso-rofi-big

if [ ! -x "$mode_script" ]; then
    chmod +x "$mode_script"
fi

rofi -show wallpaper \
        -modi "wallpaper:$mode_script" \
        -show-icons \
        -theme "$dir/$theme"
