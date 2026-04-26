#!/usr/bin/env bash

theme="kanso-rofi-big"
dir="$HOME/.config/rofi"

uwsm-app -- rofi -modi clipboard:$dir/"cliphist-rofi-img.sh" -show clipboard -show-icons -theme $dir/"$theme"
