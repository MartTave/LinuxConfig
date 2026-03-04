import QtQuick
import QtQuick.Controls
import Quickshell
import Quickshell.Services.UPower
import "../components" as QsComponents
import "./Base.qml"

Base {
    id: root
    width: childrenRect.width
    height: childrenRect.height
    anchors.verticalCenter: parent.verticalCenter

    property var batteryIcons: ["󰂎", "󰁺", "󰁻", "󰁼", "󰁽", "󰁾", "󰁿", "󰂀", "󰂁", "󰂂", "󰁹"]
    property var batteryChargingIcons: ["󰢟", "󰢜", "󰂆", "󰂇", "󰂈", "󰢝", "󰂉", "󰢞", "󰂊", "󰂋", "󰂅"]
    property int currentBatteryPercentage: Math.floor(UPower.displayDevice.percentage * 100)
    property int currentBatteryLevel: Math.floor(currentBatteryPercentage / 10)

    Row {
        spacing: 5
        Text {
            color: root.fontColor
            font.pixelSize: root.iconSize
            anchors.verticalCenter: parent.verticalCenter
            anchors.verticalCenterOffset: -1
            text: {
                if (!UPower.onBattery) {
                    return root.batteryChargingIcons[root.currentBatteryLevel];
                } else {
                    return root.batteryIcons[root.currentBatteryLevel];
                }
            }
        }
        Text {
            font.family: root.fontFamily
            font.pixelSize: root.fontSize
            color: root.fontColor
            anchors.verticalCenter: parent.verticalCenter
            text: root.currentBatteryPercentage.toString().padStart(3, " ") + "%"
        }
    }
}
