import QtQuick
import Quickshell

import "../services" as QsServices

Item {
    id: root

    // Expose default property so children can be added directly
    default property alias content: contentRow.data

    // Padding property (customizable)
    property int h_padding: 15
    property int v_padding: 10

    property int pillHeight: QsServices.Constants.pillHeight

    property int spacing: 12

    implicitWidth: contentRow.implicitWidth + h_padding * 2
    // Variable height
    // implicitHeight: contentRow.implicitHeight + v_padding
    implicitHeight: pillHeight
    anchors.verticalCenter: parent.verticalCenter

    Rectangle {
        anchors.fill: parent
        color: QsServices.Constants.backgroundColor
        radius: 8
    }

    Row {
        id: contentRow
        spacing: root.spacing

        anchors.centerIn: parent
        anchors.leftMargin: root.h_padding
        anchors.rightMargin: root.h_padding
        anchors.topMargin: root.v_padding
        anchors.bottomMargin: root.v_padding
        
    }
}