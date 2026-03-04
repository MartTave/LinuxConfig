import QtQuick
import Quickshell
import Quickshell.Networking

import "../services" as QsServices
import "./Base.qml"

Base {
    id: root

    property var type: undefined

    readonly property var nw: QsServices.Network

    Row {
        Text {
            color: root.fontColor
            font.pixelSize: root.iconSize

            anchors.verticalCenter: parent.verticalCenter

            anchors.verticalCenterOffset: -1

            text: {
                if (root.nw.ethernet !== undefined) {
                    if (root.nw.ethernet.connected) {
                        return "󰈁";
                    } else {
                        return "󰈂";
                    }
                } else if (root.nw.wifi !== undefined) {
                    let state = root.nw.wifi.nmState;
                    if (state > 100 || state == 30) {
                        // 110 = Disconnected ??
                        // 30 = Disconnected
                        return "󰤯";
                    } else if (state >= 40 && state < 100) {
                        // 40 - 90 -> connecting
                        return "󱛆";
                    } else if (state == 100) {
                        // State == Connected
                        return "󰖩";
                    }
                }
                return "󰇨";
            }
        }
    }
}
