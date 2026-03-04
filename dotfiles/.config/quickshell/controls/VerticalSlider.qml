import QtQuick
import QtQuick.Controls

import "../services" as QsServices

Slider {
    id: control
    orientation: Qt.Vertical

    stepSize: 1
    from: 0
    to: 100

    height: 400

    width: 40

    snapMode: Slider.SnapAlways

    // To customize : https://doc.qt.io/qt-6/qtquickcontrols-customize.html#customizing-slider

    background: Rectangle {
        x: control.leftPadding
        y: control.topPadding + control.availableHeight / 2 - height / 2

        height: parent.height
        width: parent.width
        radius: parent.width
        color: QsServices.Constants.fontColor

        anchors {
            horizontalCenter: parent.horizontalCenter
        }

        // color: "red"

        Rectangle {
            width: parent.width
            height: Math.max(control.visualPosition * (control.availableHeight - control.width) + control.width, control.width)
            color: QsServices.Constants.fontDisabledColor
            radius: control.width
        }
    }

    handle: Rectangle {
        x: control.topPadding + control.availableWidth / 2 - width / 2
        y: control.topPadding + control.visualPosition * (control.availableHeight - height)

        color: QsServices.Constants.fontColor


        height: parent.width
        width: parent.width
        radius: parent.width

        anchors {
            horizontalCenter: parent.horizontalCenter
        }
    }
}
