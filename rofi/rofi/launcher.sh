#!/usr/bin/env bash

theme="kanso-rofi"
dir="$HOME/.config/rofi"

uwsm-app -- rofi -no-lazy-grab -show drun -modi drun -no-fixed-num-lines -lines 5 -theme $dir/"$theme" -run-command "uwsm app -- {cmd}"
