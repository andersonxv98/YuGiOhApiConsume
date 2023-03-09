import QtQuick
import QtQuick.Controls
Item {
    anchors.fill: parent

    Rectangle{
        id: pageBody
        width: parent.width
        height: parent.height *0.8
        y: parent.height * 0.1
        color: "lightblue"
    Rectangle{
        width: parent.width
        height: parent.height
        //color: "lightblue"
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
            height: parent.height
            radius: 5
            border.color: "black"
            TextField
            {
            id: input
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
        y: parent.height * 0.1
        color: "gray"
        radius: 5
        border.width: 5
        border.color: "black"
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
