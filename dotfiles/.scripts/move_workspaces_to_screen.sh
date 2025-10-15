#!/bin/sh

# Check for the correct number of arguments
if [ "$#" -eq 0 ] || [ "$#" -gt 2 ]; then
    echo "Usage: $0 <monitor1> [monitor2]"
    exit 1
fi

# If one monitor is specified, move all workspaces to it
if [ "$#" -eq 1 ]; then
    hyprctl keyword workspace 1, persistent:true, monitor:$1, default:true
    hyprctl dispatch moveworkspacetomonitor "1 $1"
    for i in $(seq 2 10); do
        hyprctl keyword workspace $i, persistent:true, monitor:$1
        hyprctl dispatch moveworkspacetomonitor "$i $1"
    done
fi

# If two monitors are specified, split the workspaces
if [ "$#" -eq 2 ]; then
    hyprctl keyword workspace 1, persistent:true, monitor:$1, default:true
    hyprctl dispatch moveworkspacetomonitor "1 $1"
    for i in $(seq 2 5); do
      hyprctl keyword workspace $i, persistent:true, monitor:$1
      hyprctl dispatch moveworkspacetomonitor "$i $1"
    done
    hyprctl keyword workspace $i, persistent:true, monitor:$2, default:true
    hyprctl dispatch moveworkspacetomonitor "6 $2"
    for i in $(seq 7 10); do
      hyprctl keyword workspace $i, persistent:true, monitor:$2
      hyprctl dispatch moveworkspacetomonitor "$i $2"
    done
fi
