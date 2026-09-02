import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Hyprland
import Quickshell.Services.UPower

import qs.Theme
import qs.Modules.Bar.Components

PanelWindow { // qmllint disable
    id: bar
    color: "transparent"
    implicitHeight: Global.barHeight

    anchors {
        top: true
        left: true
        right: true
    }

    RowLayout {
        id: left
        anchors {
            left: parent.left
            leftMargin: 20
            verticalCenter: parent.verticalCenter
        }
        layoutDirection: Qt.LeftToRight
        spacing: 20
        //TODO: onClicked, open logout widget
        Arch {}
        HyprWorkspaces {}
        HyprTopLevel {}
    }

    RowLayout {
        id: center
        anchors.centerIn: parent
        spacing: 0
        Clock {}
    }

    RowLayout {
        id: right

        Layout.fillWidth: true
        layoutDirection: Qt.LeftToRight
        spacing: 13
        anchors {
            right: parent.right
            rightMargin: 20
            verticalCenter: parent.verticalCenter
        }

        Sound {}
        Wifi {}
        Battery {}
    }
}
