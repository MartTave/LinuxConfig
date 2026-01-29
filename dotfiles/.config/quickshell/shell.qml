import Quickshell
import QtQuick

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }
    color: "#ffffff"
    implicitHeight: 30


    Text {
        anchors.centerIn: parent
        text: "Hello :("
    }
}
