import QtQuick

Item {
    Rectangle{
        id: top
        width:parent.width
        height: parent.height * 0.2
        color: 'blue'
        Text {
            id: lbname
            font.pointSize: 18
            text: qsTr("Name: ")
        }
        Text {
            id: tname
            font.pointSize: 18
            anchors.left: lbname.right
            text: qsTr("Name")
        }

    }

    Connections{

        target: controller

        //function onImgChanged(cmainho){
           // console.log("inside qml OInIMGCHANGED");
           //ibagens.source = cmainho;
        //}

        function onCardAppended(id, name, level,atk, def, desc, type, atribute, race, source){
            // console.log("inside qml OInIMGppended");
           //var obj = {"id": id,"name": name,"level": level,"atk":  atk,"def": def,"desc" :desc,"type":  type,"atribute": atribute,"race": race,"source" : source};
           //cardModel.append(obj);
            tname.text = name;
            //console.log("Value origin: ",cardModel.get(0).name);
        }
    }
}
