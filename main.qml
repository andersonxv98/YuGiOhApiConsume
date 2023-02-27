import QtQuick

Window {
    width: 480
    height: 640
    visible: true
    title: qsTr("Hello World")

    Loader{
        source:  "qrc:/headerView.qml"
        anchors.fill: parent
    }
    Loader{
        source: "qrc:/CardView.qml"
        anchors.fill: parent
    }
    /*Loader{
        source: "qrc:/filterView.qml"
        anchors.fill: parent
    }*/

    Loader{
        source: "qrc:/footerView.qml"
        anchors.fill: parent
    }
}
