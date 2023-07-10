#!/bin/sh

# volumeicon &
nm-applet &

# background
# feh --bg-scale ~/Wallpapers/mike-enerio-XsH3wpZzBKc-unsplash.jpg &
# feh --bg-scale ~/.config/backgrounds/Wallpaperkiss_1208315.jpg &

# compositor
#picom --config ~/.config/picom/picom.conf &

# sxhkd
sxhkd -c ~/.config/qtile/sxhkd/sxhkdrc &

# Notifications
dunst &

telegram-desktop &

