import Quickshell
import QtQuick

import "./components" as QsComponents
import "./services" as QsServices
import "./widgets" as QsWidgets

ShellRoot {
    id: shellRoot

    property var test: QsComponents.Constants.backgroundColor

    property bool controlBarToggle: false
    property bool controlBarVisible: false

    onControlBarToggleChanged: {
        if (controlBarToggle) {
            openAnim.start();
        } else {
            closeAnim.start();
        }
        console.log("Screens : ", Quickshell.screens);
    }

    Variants {
        model: Quickshell.screens

        PanelWindow {
            property var modelData
            id: topBar
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            margins {
                top: 7
                left: 7
                right: 7
            }

            implicitHeight: 30

            color: "transparent"

            Row {
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                spacing: 15

                QsComponents.Pill {
                    QsComponents.Workspaces {}
                }
            }

            QsComponents.Pill {
                h_padding: 20
                anchors.centerIn: parent
                QsComponents.CenterTime {}
            }

            Row {
                spacing: 15
                anchors.right: parent.right
                anchors.verticalCenter: parent.verticalCenter

                QsComponents.Pill {
                    QsComponents.Cpu {}
                    QsComponents.Separator {}
                    QsComponents.Memory {}
                }

                QsComponents.Pill {
                    QsComponents.NetworkController {}
                    QsComponents.Separator {}
                    QsComponents.BluetoothControl {}
                }

                QsComponents.Pill {
                    QsComponents.BrightnessControl {}
                    QsComponents.Separator {}
                    QsComponents.Volume {}
                    QsComponents.Separator {}
                    QsComponents.Battery {}
                }
            }
        }
    }

    PanelWindow {
        id: controlPopup
        visible: shellRoot.controlBarVisible
        exclusionMode: PanelWindow.ExclusionMode.Ignore

        readonly property int rightVisible: 15
        readonly property int rightHidden: -250

        anchors {
            right: true
        }

        margins {
            // To dev :
            // right: rightVisible

            // To prod
            right: rightHidden
        }

        implicitWidth: 200
        implicitHeight: 800
        color: "transparent"

        LazyLoader {
            loading: true
            active: shellRoot.controlBarVisible
            component: QsWidgets.SoundBrightnessControl {}
        }

        SequentialAnimation {
            id: openAnim
            ScriptAction {
                script: {
                    shellRoot.controlBarVisible = true;
                }
            }
            NumberAnimation {
                target: controlPopup
                property: "margins.right"
                easing.type: Easing.OutCubic
                duration: 200
                to: controlPopup.rightVisible
            }
        }

        SequentialAnimation {
            id: closeAnim
            NumberAnimation {
                target: controlPopup
                property: "margins.right"
                to: controlPopup.rightHidden
                duration: 300
                easing.type: Easing.InQuad
            }
            ScriptAction {
                script: {
                    shellRoot.controlBarVisible = false;
                }
            }
        }
    }
}
