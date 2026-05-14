#!/usr/bin/env bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE_SCRIPT="$SCRIPT_DIR/wallpaper.sh"
THEME="$SCRIPT_DIR/kanso-rofi-big.rasinc"

pkill rofi || true

rofi -show wallpaper \
     -modi "wallpaper:$MODE_SCRIPT" \
     -show-icons \
     -theme "$THEME"
