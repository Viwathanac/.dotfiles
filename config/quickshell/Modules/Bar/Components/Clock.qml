import Quickshell
import QtQuick
import QtQuick.Layouts

import qs.Theme

Item {
    id: root
    implicitHeight: parent.implicitHeight
    implicitWidth: clockModule.implicitWidth

    readonly property string moduleIcon: ""
    readonly property color moduleColor: Colors.mauve
    readonly property int moduleSize: 16

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }

    MouseArea {
        anchors.fill: parent
        enabled: true
        hoverEnabled: true
        cursorShape: Qt.PointingHandCursor
        acceptedButtons: Qt.LeftButton
        //TODO: hovering and onClick, open Calendar Widget
    }

    RowLayout {
        id: clockModule
        anchors.centerIn: parent
        spacing: 9
        Text {
            text: {
                Qt.formatTime(clock.date, "hh:mm AP");
            }
            color: root.moduleColor
            font.family: Global.font
            font.pixelSize: root.moduleSize
        }
        Text {
            text: {
                "- " + Qt.formatDate(clock.date, "yyyy-MM-dd");
            }
            color: root.moduleColor
            font.family: Global.font
            font.pixelSize: root.moduleSize
        }
    }
}
