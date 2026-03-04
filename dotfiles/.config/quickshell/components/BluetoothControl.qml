import QtQuick
import Quickshell
import Quickshell.Bluetooth

import "../services" as QsServices
import "./Base.qml"

Base {
    id: root

    property var bluetooth: QsServices.Bluetooth

    Row {
        Text {
            color: root.fontColor
            font.pixelSize: root.iconSize
            anchors.verticalCenter: parent.verticalCenter

            anchors.verticalCenterOffset: -1

            text: {
                if (!root.bluetooth.ready || !root.bluetooth.enabled) {
                    return "󰂲";
                } else if (root.bluetooth.connected) {
                    return "󰂱";
                }
                return "";
            }
        }
    }
}
