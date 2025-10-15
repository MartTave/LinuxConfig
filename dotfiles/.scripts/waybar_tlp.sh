#!/bin/bash

# This script listens for TLP profile changes via D-Bus and outputs JSON for Waybar.

update_icon() {
    # Get the current profile from tlp-stat
    current_profile=$(tlp-stat -p | grep 'TLP power profile' | awk '{print $4}')

    if [[ "$current_profile" == "performance" ]]; then
        icon="󱐋 "
        tooltip="TLP: Performance"
    else # Assuming "powersave"
        icon=" "
        tooltip="TLP: Powersave"
    fi

    # Output JSON for Waybar
    printf '''{"text": "%s", "tooltip": "%s", "class": "%s"}''' "$icon" "$tooltip" "$current_profile"
    echo # Add a newline
}

# Output the initial state
update_icon

# Listen for the D-Bus signal from TLP when the profile switches.
# The output of dbus-monitor is piped into a while loop that does nothing,
# but the loop is necessary for update_icon to be called on every signal.
dbus-monitor --system "type='signal',interface='lin.TLP.TLP',member='ProfileSwitched'" | while read -r; do
    update_icon
done
