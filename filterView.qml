import QtQuick
import QtQuick.Controls
Item {
    anchors.fill: parent

    Rectangle{
        id: pageBody
        width: parent.width
        height: parent.height *0.8
        y: parent.height * 0.05
        //color: "yellow"
    Rectangle{
        id: recTopSC
        width: parent.width
        height: parent.height * 0.05
        //color: "green"
        //border.color: "black"
        radius: 5
        Text{
            id: labelSearch
            text: "search: "
            //font.pointSize:  24
        }
        Rectangle {
            anchors.left: labelSearch.right
            width: parent.width
            height: parent.height * 0.1
            radius: 5
            //color: "lightblue"
            //border.color: "blue"
            TextField
            {
            id: input
            width: parent.width * 0.90
            placeholderText:   qsTr("Find by name or description")
            text: "";

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
        y: recTopSC.height + recTopSC.y
        color: "transparent"
        radius: 5
        border.width: 5
        border.color: "black"
        Text{
            id: lbMFiltter
            text: "Race : "
        }
        ComboBox {
            x: lbMFiltter.width
            width: parent.width * 0.4
            height: lbMFiltter.height
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
        }
        Text{
            id: lbATRFiltter
            y:lbMFiltter.y + lbMFiltter.height
            text: "Attribute: "
        }
        ComboBox {
            x: lbATRFiltter.width
            y: lbATRFiltter.y
            width: parent.width * 0.4
            height: lbATRFiltter.height
            model: ["",
                 'dark','divine','earth','fire', 'light', 'water', 'wind']
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setAttribute(currentText);
            }
        }
        Text{
            id: lvlFiltter
            y:lbATRFiltter.y + lbATRFiltter.height
            text: "Level: "
        }
        ComboBox {
            id: cbox
            x: lvlFiltter.width
            y: lvlFiltter.y
            width: parent.width * 0.4
            height: lvlFiltter.height
            model: ["",
                 "1","2","3","4","5","6","7","8","9","10","11","12"]
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setLevel(currentText);
            }
        }

        Row {
            x: cbox.width * 1.1 + cbox.x
            y: cbox.y
            RadioButton {
                checked: true
                text: qsTr("Equal ")
                onClicked: {
                    controller.setLevelOpt("");
                }
            }
            RadioButton {
                text: qsTr("Greater \n than equals ")
                onClicked: {
                    controller.setLevelOpt("gte");
                }
            }
            RadioButton {
                text: qsTr("Less \n than equals ")
                onClicked: {
                    controller.setLevelOpt("lte");
                }
            }
        }
        Text{
            id: lbFrameFiltter
            y:lvlFiltter.y + lvlFiltter.height
            text: "Monster Type: "
        }
        ComboBox {
            x: lbFrameFiltter.width
            y: lbFrameFiltter.y
            width: parent.width * 0.4
            height: lbFrameFiltter.height
            model: ["",
                'Normal Monster', 'Normal Tuner Monster', 'Effect Monster', 'Tuner Monster', 'Flip Monster', 'Flip Effect Monster', 'Flip Tuner Effect Monster', 'Spirit Monster', 'Union Effect Monster', 'Gemini Monster', 'Pendulum Effect Monster', 'Pendulum Normal Monster', 'Pendulum Tuner Effect Monster', 'Ritual Monster', 'Ritual Effect Monster', 'Toon Monster', 'Fusion Monster', 'Synchro Monster', 'Synchro Tuner Monster', 'Synchro Pendulum Effect Monster', 'XYZ Monster', 'XYZ Pendulum Effect Monster', 'Link Monster', 'Pendulum Flip Effect Monster', 'Pendulum Effect Fusion Monster' , 'Token']
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setFrameType(currentText);
            }
        }
        Text{
            id: lbATKFiltter
            y:lbFrameFiltter.y + lbFrameFiltter.height
            text: "ATK: "
        }
        TextField{
            id: txf1
            x: lbATKFiltter.x + lbATKFiltter.width
            y:  lbATKFiltter.y
            placeholderText: "search by ATK";
            width: 100
            onTextChanged: {
                controller.setATK(txf1.text);
            }
        }
        Row {
            x: txf1.width * 1.1 + txf1.x
            y: txf1.y
            RadioButton {
                checked: true
                text: qsTr("Equal ")
                onClicked: {
                    controller.setATKOpt("");
                }
            }
            RadioButton {
                text: qsTr("Greater TE ")
                onClicked: {
                    controller.setATKOpt("gte");
                }
            }
            RadioButton {
                text: qsTr("Less TE ")
                onClicked: {
                    controller.setATKOpt("lte");
                }
            }
        }
        Text{
            id: lbDEFFiltter
            y:lbATKFiltter.y + lbATKFiltter.height
            text: "DEF: "
        }
        TextField{
            id: txf2
            x: lbDEFFiltter.x + lbDEFFiltter.width
            y: lbDEFFiltter.y
            width: 100

            placeholderText: "search by DEF";
            onTextChanged: {
                controller.setDEF(txf2.text);
            }
        }
        Row {
            x: txf2.width * 1.1 + txf2.x
            y: txf2.y
            RadioButton {
                checked: true
                text: qsTr("Equal ")
                onClicked: {
                    controller.setDEFOpt("");
                }
            }
            RadioButton {
                text: qsTr("Greater TE ")
                onClicked: {
                    controller.setDEFOpt("gte");
                }
            }
            RadioButton {
                text: qsTr("Less TE ")
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
        color: "lightgreen"
        radius: 5
        border.width: 5
        border.color: "black"
        Text{
            id: lbSTFiltter
            text: "Spell/Trap Type: "
        }
        ComboBox {
            x: lbSTFiltter.width
            width: parent.width * 0.4
            height: lbSTFiltter.height
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
        }
        Text{
            id: lbFiltterST
            y:lbSTFiltter.y + lbSTFiltter.height
            text: "Type: "
        }
        ComboBox {
            x: lbFiltterST.width
            y: lbFiltterST.y
            width: parent.width * 0.4
            height: lbFiltterST.height
            model: ["",
                'Skill Card', 'Spell Card', 'Trap Card']
            onCurrentTextChanged: {
                console.log("VALOR: ", currentText);
                controller.setFrameType(currentText);
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
