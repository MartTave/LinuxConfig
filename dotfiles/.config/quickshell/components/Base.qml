import QtQuick
import "../services" as QsServices

Item {
    property int fontSize: QsServices.Constants.fontSize
    property int iconSize: QsServices.Constants.iconSize
    property string fontColor: QsServices.Constants.fontColor
    property string fontFamily: QsServices.Constants.fontFamily
    
    
    anchors.verticalCenter: parent.verticalCenter
    width: childrenRect.width
    height: childrenRect.height
}