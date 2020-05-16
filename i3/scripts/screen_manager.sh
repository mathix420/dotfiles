#! /bin/bash

match=$(xrandr | grep -oE "^(DP-[1-2]) connected" | cut -d' ' -f1)

if test -n "$match"; then
    xrandr --output $match --auto --right-of eDP-1
    echo "$match set right of eDP-1";
else
    xrandr --auto
    echo "reset current setup";
fi
