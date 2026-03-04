import QtQuick
import Quickshell

import "../services" as QsServices
import "./Base.qml"

Base {
    id: root
    readonly property var sm: QsServices.SystemMonitor

    Row {
        spacing: 3
        Text {
            width: root.iconSize
            color: root.fontColor
            font.pixelSize: root.iconSize
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -2
            text: "󰘚"
        }

        Text {
            font.family: root.fontFamily
            font.pixelSize: root.fontSize
            color: root.fontColor
            text: {
                return Math.round(root.sm.cpu).toString().padStart(3, " ") + "%";
            }
        }
    }
}
