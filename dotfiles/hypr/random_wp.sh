#!/bin/bash
for mon in $(hyprctl monitors | grep Monitor | awk '{print $2 }'); do

wp=`hyprctl hyprpaper listloaded | shuf -n 1`
echo $wp
hyprctl hyprpaper wallpaper "$mon,$wp"

done
