import QtQuick
import QtQuick.Controls
import Quickshell.Networking

import qs.Theme

Item {
    id: root
    implicitWidth: networkModule.implicitWidth
    implicitHeight: Global.barHeight

    property var connected: Networking.devices.values.find(nwDevices => nwDevices.connected)
    property string moduleIcon: connected ? "󰤨" : "󰤭"
    property color moduleColor: Networking.wifiEnabled ? Colors.green : Colors.red
    property int moduleSize: 16

    MouseArea {
        anchors.fill: parent
        enabled: true
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
    }
    Text {
        id: networkModule
        anchors.centerIn: parent
        text: root.moduleIcon
        color: root.moduleColor
        font.family: Global.font
        font.pixelSize: root.moduleSize
    }
}
