import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Window 2.2

ApplicationWindow {
    id: center
    visible: false
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    flags: Qt.FramelessWindowHint

    property int pointSize: 16

    Rectangle {
        id: titleBar
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.margins: 5
        height: 50
        color: "#2f2e4b"
    }

    Button {
        id: closeBtn
        anchors.right: titleBar.right
        anchors.top: titleBar.top
        anchors.bottom: titleBar.bottom
        anchors.margins: 5
        implicitWidth: 40
        implicitHeight: 40
        text: "X"
        font.pointSize: pointSize
        onClicked: Qt.quit()
    }

    SwipeView {
        id: swipeView
        x: 50
        y: 100
        width: 200
        height: 200

        currentIndex: 1
        anchors.fill: parent

        Item {
            id: firstPage
        }
        Item {
            id: secondPage
        }
        Item {
            id: thirdPage
        }

    }
    PageIndicator {
        id: indicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        //anchors.horizontalCenter: parent.horizontalCenter
    }


    background: Rectangle {
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0; color: "#0d1725"}
            GradientStop { position: 1; color: "#1d7078"}
        }
    }

    Loader {
        id: projectManageDlg
        source: "ProjectManageDlg.qml"
        visible: status == Loader.Ready
    }

    Connections {
        target: projectManageDlg.item
        onLogin: {
            center.visible = true
            projectManageDlg.source = ""
        }
        onExit: {
            Qt.quit()
        }
    }
}
