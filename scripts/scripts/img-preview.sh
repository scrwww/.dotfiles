#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o pipefail

image="$1"
handler="${FZF_PREVIEW_IMAGE_HANDLER:-sixel}"

case "$handler" in
  sixel)
    # Clear screen before printing new sixel image
    printf '\033[2J\033[H'
    chafa -f sixel -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}" \
      "$image" --animate false
    ;;
  kitty)
    # Clear previous images first
    kitten icat --clear --stdin=no
    kitten icat --transfer-mode=memory --stdin=no \
      --place="${FZF_PREVIEW_COLUMNS}x$((FZF_PREVIEW_LINES - 1))@0x0" "$image" \
      | sed '$d' | sed $'$s/$/\e[m/'
    ;;
  symbols)
    printf '\033[2J\033[H'
    chafa -f symbols -s "${FZF_PREVIEW_COLUMNS}x${FZF_PREVIEW_LINES}" \
      "$image" --animate false
    ;;
  *)
    echo "Unsupported handler: $handler"
    ;;
esac

