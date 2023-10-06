#!/usr/bin/env bash

# Use tiling windows
yabai -m config layout bsp

# Add gaps
yabai -m config \
    window_gap 5 \
    top_padding 5 \
    bottom_padding 5 \
    left_padding 5 \
    right_padding 5

# Add space for sketchybar
yabai -m config external_bar all:30:0

# Focus on mouse hover
yabai -m config focus_follows_mouse autoraise

# Fallback
# yabai -m config layout float

# Ignore this windows
yabai -m rule --add app="^System Preferences$" manage=off

