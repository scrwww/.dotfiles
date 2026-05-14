#!/usr/bin/env bash
WALLPAPER_DIR="$HOME/Pictures/Wallpapers"
CACHE_DIR="$HOME/.cache/wallpaper-thumbs"
LAST_WALL_FILE="$HOME/.cache/last-wallpaper"
THUMB_SIZE="320x180"

# Ensure cache directory exists
mkdir -p "$CACHE_DIR"

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

set_wallpaper() {
    local wall_name="$1"
    local wall_path
    
    wall_path=$(find "$WALLPAPER_DIR" -type f -name "$wall_name" | head -1)
    
    if [[ -f "$wall_path" ]]; then
        echo "$wall_path" > "$LAST_WALL_FILE"
        
        pkill swaybg || true
        
        exec_detached "swaybg -i \"$wall_path\" -m fill"
        
        notify-send -u low "Wallpaper" "Set to: ${wall_name}"
        
        exit 0
    else
        notify-send -u critical "Wallpaper" "Error: Could not find $wall_name"
        exit 1
    fi
}

list_wallpapers() {
    local im_bin
    im_bin=$(command -v magick || command -v convert)

    find "$WALLPAPER_DIR" -type f -follow | grep -iE '\.(jpg|jpeg|png|webp|gif)$' | sort | while read -r f; do
        local filename
        filename=$(basename "$f")
        local hash
        hash=$(echo -n "$f" | md5sum | cut -c1-8)
        local thumb="$CACHE_DIR/$hash.jpg"

        if [[ ! -f "$thumb" && -n "$im_bin" ]]; then
            "$im_bin" "$f" -thumbnail "$THUMB_SIZE^" -gravity center -extent "$THUMB_SIZE" "$thumb" >/dev/null 2>&1 || continue
        fi

        if [[ -f "$thumb" ]]; then
            printf "%s\0icon\x1f%s\n" "$filename" "$thumb"
        else
            echo "$filename"
        fi
    done
}

if [[ $# -gt 0 ]]; then
    set_wallpaper "$1"
else
    list_wallpapers
fi
