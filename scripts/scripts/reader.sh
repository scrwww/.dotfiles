#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

books_dir="$HOME/Documents/Books/"
tmpfile="/tmp/book-selection"

fd 'pdf|pub|epub' $books_dir | fzf > $tmpfile
book_sel=$(<"$tmpfile")

if [[ ! -f $book_sel ]]; then
    echo "No book selected."
    exit 0
fi

[[ -z ${book_sel:-} ]] && exit 0
[[ ! -f "$book_sel" ]] && { echo "File not found: $book_sel"; exit 1; }

uwsm-app -- zathura --fork "${book_sel}" && exit
