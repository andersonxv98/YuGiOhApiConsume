import QtQuick
import QtQuick.Controls
Item {
    anchors.fill: parent
    property string textColors: "#E1EBFA"
    property  double fontSize:  labelSearch.font.pointSize
    property double spacing: (parent.height * 0.8) / 48


    Rectangle{
        id: pageBody
        width: parent.width
        height: parent.height *0.8
        y: parent.height * 0.07
        gradient: Gradient {

              GradientStop { position: 0.0; color: "#373940" }
              GradientStop { position: 1.0; color: "black" }
          }
    Rectangle{
        id: recTopSC
        width: parent.width
        height: parent.height * 0.05
        color: "#2E3033"
        //border.color: "black"
        radius: 5
        Text{
            id: labelSearch
            text: "search: "
              font.pointSize: recTopSC.height * 0.5
              color: textColors
             x: parent.width * 0.03
        }
        Rectangle {
            anchors.left: labelSearch.right


            width: parent.width - (labelSearch.width+ (labelSearch.x* 2))
            height: parent.height * 0.1
            radius: 5
            color: "transparent"
            //border.color: "blue"
            TextField
            {
            id: input
            width: parent.width
            placeholderText:   qsTr("Find by name or description")
            font.pointSize: labelSearch.font.pointSize
            text: "";
            background:
                Rectangle{
                radius: 5
                color: "#e1f8fa"
            }
            height: labelSearch.height
            onTextChanged: {
                controller.setDesc(input.text)
            }
            TapHandler{
                onTapped: {
                    selectTextOnSearch();
                }
            }

            }
            TapHandler{
                onTapped: {
                    selectTextOnSearch();
                }
            }
        }
    }
    Rectangle{//Monster section

        id: monsterfilterBody
        width: parent.width
        height: parent.height *0.8
        y: recTopSC.height + recTopSC.y + spacing
        color: "transparent"
        radius: 5


        Text{
            id: lbMFiltter
            text: "Race : "
            color: textColors
            font.pointSize: fontSize
            x: parent.width * 0.03
        }
        ComboBox {
            id: cbrace
            x: lbMFiltter.width + lbMFiltter.x
            width: parent.width * 0.4
            height: lbMFiltter.height
            font.pointSize:fontSize
            model: ["",
                "Aqua",
                "Beast",
                "Beast-Warrior",
                "Creator-God",
                "Cyberse",
                "Dinosaur",
                "Divine-Beast",
                "Dragon",
                "Fairy",
                "Fiend",
                "Fish",
                "Insect",
                "Machine",
                "Plant",
                "Psychic",
                "Pyro",
                "Reptile",
                "Rock",
                "Sea Serpent",
                "Spellcaster",
                "Thunder",
                "Warrior",
                "Winged Beast",
                "Wyrm",
                "Zombie"]
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setRace(currentText);
            }
            background: Rectangle {
                color:"#5b5f6a"
                radius: 5
            }

            contentItem:  Text {
                leftPadding: 0
                //rightPadding: cbHeader.indicator.width + control.spacing

                text: cbrace.displayText
                font: cbrace.font
                color: cbrace.pressed ? "#e1f8fa" : "#E1EBFA"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        Text{
            id: lbATRFiltter
            y:lbMFiltter.y + lbMFiltter.height + spacing
            text: "Attribute: "
            color: textColors
            font.pointSize: fontSize
            x: lbMFiltter.x
        }
        ComboBox {
            id: cbAtr
            x: lbATRFiltter.width + lbMFiltter.x
            y: lbATRFiltter.y
            font.pointSize:fontSize
            width: parent.width * 0.4
            height: lbATRFiltter.height
            model: ["",
                 'dark','divine','earth','fire', 'light', 'water', 'wind']
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setAttribute(currentText);
            }
            background: Rectangle {
                    color:"#5b5f6a"
                    radius: 5
                }

            contentItem:  Text {
                leftPadding: 0
                //rightPadding: cbHeader.indicator.width + control.spacing

                text: cbAtr.displayText
                font: cbAtr.font
                color: cbAtr.pressed ? "#e1f8fa" : "#E1EBFA"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        Text{
            id: lvlFiltter
            y:lbATRFiltter.y + lbATRFiltter.height + spacing
            text: "Level: "
            color: textColors
            font.pointSize: fontSize
            x: lbMFiltter.x
        }
        ComboBox {
            id: cbox
            x: lvlFiltter.width + lbMFiltter.x
            y: lvlFiltter.y
            width: parent.width * 0.4
            font.pointSize:fontSize
            height: lvlFiltter.height
            model: ["",
                 "1","2","3","4","5","6","7","8","9","10","11","12"]
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setLevel(currentText);
            }
            background: Rectangle {
                color:"#5b5f6a"
                radius: 5
            }

            contentItem:  Text {
                leftPadding: 0
                //rightPadding: cbHeader.indicator.width + control.spacing

                text: cbox.displayText
                font: cbox.font
                color: cbox.pressed ? "#e1f8fa" : "#E1EBFA"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

        Row {
            x: cbox.width * 1.1 + cbox.x + lbMFiltter.x
            y: cbox.y
            spacing: 10
            RadioButton {
                id:rb9
                checked: true
                contentItem: Text {
                    text: qsTr("Equal ")
                    color: textColors
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb9.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb9.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb9.checked
                        }
                    }
                onClicked: {
                    controller.setLevelOpt("");
                }
            }
            RadioButton {
                id: rb3
                contentItem: Text {
                    text: qsTr("Greater TE ")
                    color: textColors
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb3.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb3.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb3.checked
                        }
                    }
                onClicked: {
                    controller.setLevelOpt("gte");
                }
            }
            RadioButton {
                id: rb2
                contentItem: Text {
                    text: qsTr("Less TE ")
                    color: textColors
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb2.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb2.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb2.checked
                        }
                    }
                onClicked: {
                    controller.setLevelOpt("lte");
                }
            }
        }
        Text{
            id: lbFrameFiltter
            x: lbMFiltter.x
            y:lvlFiltter.y + lvlFiltter.height + spacing
            text: "Monster Type: "
            color: textColors
            font.pointSize: fontSize
        }
        ComboBox {
            id: cbType
            x: lbFrameFiltter.width + lbMFiltter.x
            y: lbFrameFiltter.y
            width: parent.width * 0.4
            height: lbFrameFiltter.height
            font.pointSize:fontSize
            model: ["",
                'Normal Monster', 'Normal Tuner Monster', 'Effect Monster', 'Tuner Monster', 'Flip Monster', 'Flip Effect Monster', 'Flip Tuner Effect Monster', 'Spirit Monster', 'Union Effect Monster', 'Gemini Monster', 'Pendulum Effect Monster', 'Pendulum Normal Monster', 'Pendulum Tuner Effect Monster', 'Ritual Monster', 'Ritual Effect Monster', 'Toon Monster', 'Fusion Monster', 'Synchro Monster', 'Synchro Tuner Monster', 'Synchro Pendulum Effect Monster', 'XYZ Monster', 'XYZ Pendulum Effect Monster', 'Link Monster', 'Pendulum Flip Effect Monster', 'Pendulum Effect Fusion Monster' , 'Token']
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setFrameType(currentText);
            }
            background: Rectangle {
                color:"#5b5f6a"
                radius: 5
            }

            contentItem:  Text {
                leftPadding: 0
                //rightPadding: cbHeader.indicator.width + control.spacing

                text: cbType.displayText
                font: cbType.font
                color: cbType.pressed ? "#e1f8fa" : "#E1EBFA"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        Text{
            id: lbATKFiltter
            y:lbFrameFiltter.y + lbFrameFiltter.height+ spacing
            x: lbMFiltter.x
            text: "ATK: "
            font.pointSize: fontSize
            color: textColors
        }
        TextField{
            id: txf1
            x: lbATKFiltter.x + lbATKFiltter.width + lbMFiltter.x
            y:  lbATKFiltter.y

            background:
                Rectangle{
                radius: 5
                color: "#e1f8fa"
            }
            placeholderText: "search by ATK";
            width: (parent.width - lbATKFiltter.width) / 3
            height: lbATKFiltter.height
            onTextChanged: {
                controller.setATK(txf1.text);
            }
        }
        Row {
            id: idRowAtkF
            x: txf1.width * 1.1 + txf1.x + lbMFiltter.x
            y: txf1.y
            spacing: 10
            RadioButton {
                id: rdb1
                checked: true
                contentItem: Text {
                    text: qsTr("Equal ")
                    color: textColors
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rdb1.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rdb1.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rdb1.checked
                        }
                    }
                onClicked: {
                    controller.setATKOpt("");
                }
            }
            RadioButton {
                id: rb4
                contentItem: Text {
                    text: qsTr("Greater TE ")
                    color: textColors
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb4.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb4.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb4.checked
                        }
                    }
                onClicked: {
                    controller.setATKOpt("gte");
                }
            }
            RadioButton {
                id: rb5
                contentItem: Text {
                    text: qsTr("Less TE ")
                    color: textColors
                   // anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb5.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb5.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb5.checked
                        }
                    }
                onClicked: {
                    controller.setATKOpt("lte");
                }
            }
        }
        Text{
            id: lbDEFFiltter
            y:lbATKFiltter.y + lbATKFiltter.height + spacing
            x: lbMFiltter.x
            text: "DEF: "
            font.pointSize: fontSize
            color: textColors
        }
        TextField{
            id: txf2
            x: lbDEFFiltter.x + lbDEFFiltter.width + lbMFiltter.x
            y: lbDEFFiltter.y
            background:
                Rectangle{
                radius: 5
                color: "#e1f8fa"
            }
            width: (parent.width - lbDEFFiltter.width) / 3
            height: lbDEFFiltter.height
            placeholderText: "search by DEF";
            onTextChanged: {
                controller.setDEF(txf2.text);
            }
        }
        Row {
            x: txf2.width * 1.1 + txf2.x + lbMFiltter.x
            y: txf2.y
            spacing: 10
            RadioButton {
                id: rb6
                checked: true
                contentItem: Text {
                    text: qsTr("Equal ")
                    color: textColors
                    y: parent.height * 1.03
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb6.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb6.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb6.checked
                        }
                    }
                onClicked: {
                    controller.setDEFOpt("");
                }
            }
            RadioButton {
                id: rb7
                contentItem: Text {
                    text: qsTr("Greater TE ")
                    color: textColors
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb7.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb7.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb7.checked
                        }
                    }
                onClicked: {
                    controller.setDEFOpt("gte");
                }
            }
            RadioButton {
                id: rb8
                contentItem: Text {
                    text: qsTr("Less TE ")
                    color: textColors
                    //anchors.top: parent.bottom
                }
                indicator: Rectangle {
                        implicitWidth:  lbATKFiltter.height /2
                        implicitHeight: lbATKFiltter.height /2

                        radius: 13
                        border.color: rb8.down ? "#e1f8fa" : "#5b5f6a"

                        Rectangle {
                            width: parent.width /3
                            height: parent.height /3
                            anchors.centerIn:  parent
                            radius: width * 0.5
                            color: rb8.down ? "#e1f8fa" : "#5b5f6a"
                            visible: rb8.checked
                        }
                    }
                onClicked: {
                    controller.setDEFOpt("lte");

                }
            }
        }

    }
    Rectangle{//Spell/Trap section
        id: spellfilterBody
        width: parent.width
        height: parent.height *0.2
        y: monsterfilterBody.height

        color: "transparent"
        radius: 5
        //border.width: 5
        //border.color: "black"
        Text{
            id: lbSTFiltter
            text: "Spell/Trap Type: "
            color: textColors
            font.pointSize: fontSize
            x:lbMFiltter.x
        }
        ComboBox {
            id: cbTypeSP
            x: lbSTFiltter.width + lbMFiltter.x
            width: parent.width * 0.4
            height: lbSTFiltter.height

            font.pointSize:fontSize
            model: ["",
                "Normal",
                "Field",
                "Equip",
                "Continuous",
                "Quick-Play",
                "Ritual",
                "Counter"]
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setRace(currentText);
            }
            background: Rectangle {
        color:"#5b5f6a"
        radius: 5
    }

            contentItem:  Text {
                leftPadding: 0
                //rightPadding: cbHeader.indicator.width + control.spacing

                text: cbTypeSP.displayText
                font: cbTypeSP.font
                color: cbTypeSP.pressed ? "#e1f8fa" : "#E1EBFA"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }
        Text{
            id: lbFiltterST
            y:lbSTFiltter.y + lbSTFiltter.height + spacing
            text: "Type: "
            color: textColors
            font.pointSize: fontSize
            x: lbMFiltter.x
        }
        ComboBox {
            id: cbNtyp
            x: lbFiltterST.width + lbMFiltter.x
            y: lbFiltterST.y
            width: parent.width * 0.4
            height: lbFiltterST.height
            font.pointSize:fontSize
            model: ["",
                'Skill Card', 'Spell Card', 'Trap Card']
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setFrameType(currentText);
            }
            background: Rectangle {
                color:"#5b5f6a"
                radius: 5
            }

            contentItem:  Text {
                leftPadding: 0
                //rightPadding: cbHeader.indicator.width + control.spacing

                text: cbNtyp.displayText
                font: cbNtyp.font
                color: cbNtyp.pressed ? "#e1f8fa" : "#E1EBFA"
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }
        }

    }




    }




    function clearTextOnSearch(){
        input.text= ""
        return;
    }
    function selectTextOnSearch(){
        input.selectAll()
    }

    Connections{
        target: controller

    }
}
