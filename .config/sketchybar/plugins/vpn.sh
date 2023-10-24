#!/bin/sh

IP="$(ifconfig | grep -A 3 tun3 | grep inet | awk '{print $2}')"

if [ -n "$IP" ]; then
  sketchybar --set $NAME label=$IP         \
                         icon=""          \
                         label.drawing=on  \
                         icon.drawing=on 
else
  sketchybar --set $NAME label.drawing=off \
                         icon.drawing=off
fi

