import QtQuick 2.11
import QtQuick.Controls 2.4

ApplicationWindow {
    id: center
    visible: false
    width: 640
    height: 480
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page {
            id: page1
            Label{
                anchors.centerIn: parent
                text: "I am page1"
            }
        }

        Page {
            id: page2
            Label{
                anchors.centerIn: parent
                text: "I am page2"
            }
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Page 1")
        }
        TabButton {
            text: qsTr("Page 2")
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
