#!/usr/bin/env bash

theme="kanso-rofi-clip"
dir="$HOME/.config/rofi"

rofi -modi clipboard:$dir/"cliphist-rofi-img.sh" -show clipboard -show-icons -theme $dir/"$theme"
