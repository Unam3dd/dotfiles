#!/bin/bash
# Modern 2025 Wallpaper Script
# Sets a random wallpaper from the 2K25 collection

WALLPAPER_DIR="/usr/share/backgrounds/2K25"


if [ ! -d $WALLPAPER_DIR ]; then
    echo -e "[\033[31m-\033[00m] $WALLPAPER_DIR not found !"
    exit 1
fi

if [ ! $(which feh) ]; then
    echo -e "[\033[31m-\033[00m] feh is not installed !"
    exit 1
fi

FILES=$(find $WALLPAPER_DIR -type f -name "*.jpg" | shuf)

while [ 1 ]; do
    for f in $FILES; do
		echo $f
        feh --bg-fill $f
        sleep 300
    done
    FILES=$(echo $FILES | shuf)
done
