#!/usr/bin/env bash

books_dir="/home/un/personal/books/"
echo $books_dir
bn="$(find $books_dir -type f | fzf)"

if [[ -z $bn ]]; then
    exit 0
fi

zathura --fork "${bn}" && exit

