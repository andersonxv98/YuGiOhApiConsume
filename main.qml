import QtQuick

Window {
    width: 480
    height: 640
    visible: true
    title: qsTr("Hello World")

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
