import QtQuick


    Item {
        anchors.fill: parent
        Rectangle{
            width: parent.width
            height: parent.height * 0.10
            y: parent.height * 0.9
            color: "transparent"

            Rectangle{ //Button return
                id: returnBtn
                width: parent.width /3
                height:  parent.height * 0.8
                x: parent.width* 0.01
                y:   (parent.height - height) / 2
                color: "#5E626E"
                radius: width * 0.1

                visible: false

                Text {
                    id: rtText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Helvetica"
                    //font.pointSize: 24
                    color: "white"
                    text: qsTr("RETURN")
                }
                TapHandler{
                    onTapped: {

                        controller.retornar();
                        alternVisibilityBtns();
                    }

                }
            }
            Rectangle{ //Button return
                id: enterBtn
                width: parent.width /3
                height:  parent.height * 0.8
                x: (parent.width - width) /2
                y:   (parent.height - height) / 2
                color: "#5E626E"
                radius: width * 0.1

                visible: true

                Text {
                    id: enterText
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.family: "Helvetica"
                    //font.pointSize: 24
                    color: "white"
                    text: qsTr("SEARCH")
                }
                TapHandler{
                    onTapped: {

                        controller.disparaRequest();
                        alternVisibilityBtns();
                    }

                }
            }

    Connections{
        target: controller

        }
        }

        function alternVisibilityBtns(){
            if(enterBtn.visible){
            enterBtn.visible = false;
            returnBtn.visible = true;
            }
            else{
                enterBtn.visible = true;
                returnBtn.visible = false;
            }
        }

    }


