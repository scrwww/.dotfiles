#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

wallpaper_dir="$HOME/Pictures/wallpapers"
tmpfile="/tmp/wallpaper-selection"

foot -e bash -c "
    find '$wallpaper_dir' -type f \
    | fzf --preview '$HOME/.config/scripts/img-preview.sh {}' > $tmpfile
"

if [[ ! -f "$tmpfile" ]]; then
    echo "No wallpaper selected."
    exit 0
fi

wallpaper_sel=$(<"$tmpfile")
rm "$tmpfile"

[[ -z ${wallpaper_sel:-} ]] && exit 0
[[ ! -f "$wallpaper_sel" ]] && { echo "File not found: $wallpaper_sel"; exit 1; }

config_file="$HOME/.cache/last-wallpaper"
echo "$wallpaper_sel" > "$config_file"

echo "Setting wallpaper: $wallpaper_sel"

monitor=`hyprctl monitors | grep Monitor | awk '{print $2}'`

hyprctl hyprpaper unload all
hyprctl hyprpaper preload $wallpaper_sel
hyprctl hyprpaper wallpaper "$monitor, $wallpaper_sel"
