#!/usr/bin/env bash
set -e

dir=~/Pictures/Wallpapers
cache=~/.cache/wallpaper-thumbs
last=~/.cache/last-wallpaper
mkdir -p "$cache"

if [ $# -gt 0 ]; then
    wall=$(find "$dir" -type f -name "$1" | head -1)
    if [ ! -f "$wall" ]; then
        notify-send -u critical "Wallpaper" "File not found: $1" >/dev/null 2>&1
        exit 1
    fi
    echo "$wall" > "$last"
    hyprctl hyprpaper unload all          >/dev/null
    hyprctl hyprpaper preload "$wall"     >/dev/null
    hyprctl hyprpaper wallpaper ",$wall"  >/dev/null
    hyprctl notify 5 5000 0 "Wallpaper" "$(basename "$wall")" >/dev/null 2>&1
    exit 0
fi

im_bin=""
command -v magick  >/dev/null 2>&1 && im_bin="magick"
command -v convert >/dev/null 2>&1 && [ -z "$im_bin" ] && im_bin="convert"

while IFS= read -r f; do
    hash=$(printf '%s' "$f" | md5sum | cut -c1-8)
    thumb="$cache/$hash.jpg"
    if [ ! -f "$thumb" ]; then
        [ -n "$im_bin" ] || continue
        "$im_bin" "$f" -thumbnail 320x180^ -gravity center -extent 320x180 "$thumb" 2>/dev/null || continue
    fi
    printf '%s\0icon\x1f%s\n' "$(basename "$f")" "$thumb"
done < <(find "$dir" -type f | grep -iE '\.(jpg|jpeg|png|webp|gif)$' | sort)
