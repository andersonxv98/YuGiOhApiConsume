import QtQuick

Window {
    id: mainApp
    width: 480
    height: 640
    visible: true
    color: "black"
    title: qsTr("My Yu Gi View")

    Rectangle{
        //anchors.fill: parent
        anchors.centerIn:  parent
        width: parent.width * 0.97
        height: parent.height * 0.97
        radius: 5
        color: "transparent"
    Loader{
        id: headerView
        source:  "qrc:/headerView.qml"
        anchors.fill: parent
    }
    Loader{
        id: cardView
        visible: false
        source: "qrc:/CardView.qml"
        anchors.fill: parent
    }
    Loader{
        id: filterView
        source: "qrc:/filterView.qml"
        anchors.fill: parent
    }

    Loader{
        source: "qrc:/footerView.qml"
        anchors.fill: parent
    }
    }

    Connections{
        target: controller

        function onDoSearch(){
            cardView.visible = true;
            headerView.visible= false
            filterView.visible = false;
        }

        function onRetorno(){
            cardView.visible = false;
            headerView.visible= true;
            filterView.visible = true;
        }
    }



}
