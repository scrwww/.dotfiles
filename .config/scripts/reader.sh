#!/usr/bin/env bash

books_dir="/home/un/personal/books/"
echo $books_dir
bn="$(find $books_dir -type f | fzf)"
zathura --fork "${bn}" && exit
