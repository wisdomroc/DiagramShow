import QtQuick 2.11
import QtQuick.Window 2.11
import QtQuick.Controls 2.4
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: applicationWindow
    visible: true
    flags: Qt.FramelessWindowHint
    width: 600
    height: 400
    title: qsTr("项目管理")
    property int pointSize: 16
    signal login
    signal exit

    background: Rectangle {
        radius: 10
        gradient: Gradient{
            GradientStop { position: 0; color: "steelBlue" }
            GradientStop { position: 1; color: "white" }
        }
    }

    Button {
        id: exitBtn
        anchors.right: parent.right
        anchors.top: parent.top
        text: qsTr("X")
        implicitWidth: 40
        implicitHeight: 40
        font.pointSize: pointSize
        onClicked: {
            Qt.quit()
        }
        contentItem: Text {
            text: exitBtn.text
            font: exitBtn.font
            color: "red"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        background: Rectangle {
            implicitWidth: 40
            implicitHeight: 40
            color: "lightGray"
            opacity: 0.5
            border.width: 2
            border.color: exitBtn.focus ? "blue" : "transparent"
        }
    }

    ColumnLayout {
        width: 200
        height: 260
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.leftMargin: 40
        Label {
            text: qsTr("调度机构：")
            font.pointSize: pointSize
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 5
            border.color: listView_ddjg.focus ? "blue" : "lightGray"
            border.width: 2
            ListView {
                id:listView_ddjg
                anchors.fill: parent
                anchors.margins: 5
                focus: true
                activeFocusOnTab: true
                model: ListModel {
                    ListElement { name: qsTr("国调") }
                    ListElement { name: qsTr("华中") }
                }
                delegate: Rectangle {
                    color: listView_ddjg.currentIndex === index ? "steelBlue" : "lightGray"
                    width: listView_ddjg.width
                    height: 30
                    Text {
                        anchors.fill: parent
                        text: name
                        font.pointSize: pointSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listView_ddjg.currentIndex = index
                        }
                    }
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Item {
                Layout.fillWidth: true
            }
            Button {
                id: addBtn
                implicitWidth: 36
                implicitHeight: 36
                text: qsTr("+")
                font.pointSize: pointSize
                ToolTip {
                    visible: addBtn.hovered
                    text: qsTr("添加调度机构")
                }
            }
            Button {
                id: deleteBtn
                implicitWidth: 36
                implicitHeight: 36
                text: qsTr("-")
                font.pointSize: pointSize
                ToolTip {
                    visible: deleteBtn.hovered
                    text: qsTr("删除调度机构")
                }
            }
        }
    }

    ColumnLayout {
        width: 200
        height: 260
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 40
        anchors.rightMargin: 40
        Label {
            text: qsTr("发布时间：")
            font.pointSize: pointSize
        }
        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: 5
            border.color: listView_fbsj.focus ? "blue" : "lightGray"
            border.width: 2
            ListView {
                focus: true
                activeFocusOnTab: true
                id: listView_fbsj
                anchors.fill: parent
                anchors.margins: 5
                model: ListModel {
                    ListElement { time: qsTr("2020年05月") }
                    ListElement { time: qsTr("2020年06月") }
                }
                delegate: Rectangle {
                    color: listView_fbsj.currentIndex === index ? "steelBlue" : "lightGray"
                    width: listView_fbsj.width
                    height: 30
                    Text {
                        anchors.fill: parent
                        text: time
                        font.pointSize: pointSize
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            listView_fbsj.currentIndex = index
                        }
                    }
                }
            }
        }
        RowLayout {
            Layout.fillWidth: true
            Item {
                Layout.fillWidth: true
            }
            Button {
                id: addBtn1
                implicitWidth: 36
                implicitHeight: 36
                text: qsTr("+")
                font.pointSize: pointSize
                ToolTip {
                    visible: addBtn1.hovered
                    text: qsTr("添加发布时间")
                }
            }
            Button {
                id: deleteBtn1
                implicitWidth: 36
                implicitHeight: 36
                text: qsTr("-")
                font.pointSize: pointSize
                ToolTip {
                    visible: deleteBtn1.hovered
                    text: qsTr("删除发布时间")
                }
            }
        }
    }

    RowLayout {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 40
        Item {
            Layout.fillWidth: true
        }

        Button {
            implicitWidth: 80
            implicitHeight: 40
            text: qsTr("确定")
            onClicked: {
                login()
            }
        }
        Button {
            implicitWidth: 80
            implicitHeight: 40
            text: qsTr("取消")
            onClicked: {
                exit()
            }
        }
    }



}
