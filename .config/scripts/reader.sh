#!/usr/bin/env bash

books_dir="$HOME/Documents"
echo $books_dir

book_sel="$(find $books_dir -type f -maxdepth 2 | grep -E 'pdf|pub|epub' | fzf )"

if [[ -z $book_sel ]]; then
    exit 0
fi

zathura --fork "${book_sel}" && exit
