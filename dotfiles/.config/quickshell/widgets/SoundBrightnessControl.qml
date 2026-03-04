import QtQuick
import QtQuick.Effects
import Quickshell

import "../controls" as QsControls
import "../services" as QsServices

PopupWindow {

    id: root

    anchor {
        window: controlPopup
        adjustment: PopupAdjustment.None
        
    }

    implicitHeight: 800
    implicitWidth: 200

    visible: shellRoot.controlBarVisible
    color: "transparent"

    Rectangle {
        opacity: 0.8
        id: background
        color: "#131314"
        radius: 10
        anchors.fill: parent
        border {
            color: "white"
            
        }
    }

    Row {
        QsControls.VerticalSlider {
            id: control
            
            stepSize: 1
            from: 0
            to: 100

            height: 400

            width: 40
        }
        QsControls.VerticalSlider {
            id: control2
            
            stepSize: 1
            from: 0
            to: 100

            height: 400

            width: 40
        }
    }
}
