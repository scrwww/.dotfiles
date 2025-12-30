#!/usr/bin/env bash

theme="kanso-rofi"
dir="$HOME/.config/rofi"

rofi -no-lazy-grab -show drun -modi drun -no-fixed-num-lines -lines 5 -theme $dir/"$theme"
