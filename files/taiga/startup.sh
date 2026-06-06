#!/bin/sh
swww-daemon & 
swww img ~/Pictures/wallpapers/nixos-wall.png
waybar &
nm-applet --indicator &

