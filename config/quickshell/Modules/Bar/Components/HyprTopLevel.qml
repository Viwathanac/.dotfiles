import QtQuick
import Quickshell.Wayland
import qs.Theme

Item {
    id: root
    implicitHeight: Global.barHeight
    implicitWidth: 500

    Text {
        anchors.left: root.left
        anchors.verticalCenter: root.verticalCenter
        width: 350
        font.family: Global.font
        font.pixelSize: 15
        color: Colors.text
        elide: Text.ElideRight
        text: {
            ToplevelManager.activeToplevel ? ToplevelManager.activeToplevel.appId + " - " + ToplevelManager.activeToplevel.title : 'Hyprland - "ARCHKIWI"';
        }
    }
}
