#!/bin/bash

MODE="$1"

case "$MODE" in
    integrated)
        echo "source = ./integrated.conf" > screen.conf
        export SCREEN_MODE="integrated"
        echo "Switched to INTEGRATED display only."
        ;;
    extends)
        echo "source = ./extends.conf" > screen.conf
        export SCREEN_MODE="extends"
        echo "Switched to EXTENDS."
        ;;
    external)
        echo "source = ./external.conf" > screen.conf
        export SCREEN_MODE="external"
        echo "Switched to EXTERNAL displays only."
        ;;
    mirror)
        echo "source = ./mirror.conf" > screen.conf
        export SCREEN_MODE="mirror"
        echo "Switched to MIRROR mode."
        ;;
    *)
        echo "Usage: switch [integrated|externals|extends|mirror]"
        exit 1
        ;;
esac
