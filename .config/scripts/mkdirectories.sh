#!/bin/bash
if [ -d "$HOME/personal" ]; then
  echo "personal does exist."
else 
    mkdir ~/personal
    mkdir ~/personal/img ~/personal/org ~/personal/pdf ~/personal/vid
    mkdir ~/personal/org/agenda/
    echo "Created personal directories"
fi

