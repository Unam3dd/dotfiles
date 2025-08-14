#!/bin/bash

# Modern 2025 Wallpaper Changer
# Changes wallpaper randomly from the 2K25 collection

WALLPAPER_DIR="/usr/share/backgrounds/2K25"
WALLPAPERS=(
    "wall2025_1.jpg"
    "wall2025_2.jpg"
    "wall2025_3.jpg"
    "wall2025_4.jpg"
    "wall2025_5.jpg"
    "wall2025_6.jpg"
)

# Get random wallpaper
RANDOM_WALLPAPER=${WALLPAPERS[$RANDOM % ${#WALLPAPERS[@]}]}
WALLPAPER_PATH="$WALLPAPER_DIR/$RANDOM_WALLPAPER"

# Set wallpaper with feh
if [ -f "$WALLPAPER_PATH" ]; then
    feh --bg-fill "$WALLPAPER_PATH"
    echo "Wallpaper changed to: $RANDOM_WALLPAPER"
else
    echo "Wallpaper not found: $WALLPAPER_PATH"
fi 