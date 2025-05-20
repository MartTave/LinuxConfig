#!/bin/bash

ICON_CONNECTED="󰇧"
ICON_DISCONNECTED="󰇨"

HTTP_STATUS=$(curl -s --max-time 2 -o /dev/null -w "%{http_code}" http://connectivitycheck.gstatic.com/generate_204)

if [ "$HTTP_STATUS" = "204" ]; then
    echo "{\"text\": \"$ICON_CONNECTED\", \"tooltip\": \"Online\"}"
else
    echo "{\"text\": \"$ICON_DISCONNECTED\", \"tooltip\": \"Offline\"}"
fi
