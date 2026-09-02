import QtQuick
import QtQuick.Controls

import qs.Theme

Item {
    id: root
    implicitWidth: archlinuxModule.implicitWidth
    implicitHeight: Global.barHeight

    readonly property string moduleIcon: ""
    readonly property color moduleColor: Colors.mauve
    readonly property int moduleSize: 16

    MouseArea {
        anchors.fill: parent
        enabled: true
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
    }
    Text {
        id: archlinuxModule
        anchors.centerIn: parent
        text: root.moduleIcon
        color: root.moduleColor
        font.family: Global.font
        font.pixelSize: root.moduleSize
    }
}
