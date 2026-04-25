#!/bin/bash

dir="$HOME/.config/rofi/launchers/type-4"
theme='style-8'

wallpapersPath=~/personal/wallpapers

sel=$(ls $wallpapersPath | rofi \
    -dmenu \
    -theme ${dir}/${theme}.rasi
)

if [[ -z $sel ]]; then
    exit 0
fi

wll=$wallpapersPath/$sel

echo '$wllcache = '$wll > ~/.cache/wallpaper/wllcache.conf

wal -si $wll

swww img $wll --transition-type none
sleep 1
cp ~/.cache/wal/colors-rofi.rasi ~/.config/rofi/colors/colors-rofi.rasi
killall waybar
waybar

wpg -a $wll
wpg -s $wll

#Other apps
zathura-pywal
pywal-discord -t default
