import QtQuick
import QtQuick.Controls
import QtQml.Models
Item {
    anchors.fill: parent
    property double sizeF: parent.width * 0.6
    ListModel {
        id: cardModel
    }

    Rectangle{
        id: imagev
        width: parent.width
        height: parent.height *0.70
        //y: parent.height * 0.1
        color: "Orange"




        TextArea {
            id: erroMsg
            text: qsTr("No cards match your search!\n please check that there are no filter conflicts")
            font.pointSize: 14

            visible: false



        }
        Connections{
            target: rq

            function onError(){
                erroMsg.visible = true;
            }
        }

        SwipeView {
            id: view

            currentIndex: 0
            anchors.fill: parent

            onCurrentIndexChanged: {
                var obj_card = cardModel.get(view.currentIndex);
                //descriptionlist.clear()
                //ldescview.currentIndex = 0;
                updateCardInfo(obj_card.id, obj_card.name, obj_card.level, obj_card.atk, obj_card.def, obj_card.desc, obj_card.type, obj_card.atribute, obj_card.race);
                //console.log("Mudou indelx", .name)
            }

            Repeater {
                    model: cardModel
                    Loader {

                        sourceComponent:
                            Image {

                                source:  model.source

                                Component.onCompleted: console.log("created:", model.id)
                                Component.onDestruction: console.log("destroyed:", index)
                            }


                    }
                }

        }

        PageIndicator {
            id: indicator

            count: view.count
            currentIndex: view.currentIndex

            anchors.bottom: view.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }



    }
    Rectangle{
        id: m1
        width: sizeF
        height: parent.height *0.3
        y: imagev.y + imagev.height
        color: "transparent"
                Rectangle{
                    id: id1
                    width: parent.width
                    height: parent.height * 0.1
                    color: 'blue'
                    Rectangle{
                        id: r1
                        width: parent.width * 2/3
                        height: parent.height
                        border.color:  "black"
                        radius:  5
                        Text {
                            id: lbName
                            x: parent.width * 0.05
                            text: qsTr("Name: ")
                        }
                        Text {
                            id: cardname
                            anchors.left: lbName.right
                            text:("CardName")
                        }
                    }
                    Rectangle{
                        width: parent.width * 1/3
                        height: parent.height
                        anchors.left: r1.right
                        border.color:  "black"
                        radius:  5
                        Text {
                            id: idC1
                            x: parent.width * 0.05
                            text:("Id: ")
                        }
                        Text {
                            id: cardid
                            anchors.left: idC1.right
                            text:("CardId")
                        }
                    }
                }
                Rectangle{
                    id: id2
                    width: parent.width
                    height: parent.height * 0.2
                    color: "green"
                    y: id1.height
                    Rectangle{
                        id: c1
                        width: parent.width /3
                        height: parent.height
                        border.color:  "black"
                        radius:  5
                        Text{
                            id: tlvl

                            x: parent.width * 0.05
                            text: "Level: "
                        }
                        Text{
                            id: cardlvl
                            anchors.left: tlvl.right
                            text: "level"
                        }
                    }
                    Rectangle{
                        id: c2
                        anchors.left: c1.right
                        width: parent.width /3
                        height: parent.height
                        border.color:  "black"
                       radius: 5
                        Text{
                            id: tatr
                            x: parent.width * 0.05
                            text: "Attribute: "
                        }
                        Text{
                            id: cardatr
                            anchors.left: tatr.right
                            text: "atr"
                        }
                    }
                    Rectangle{
                        id: c3
                        anchors.left: c2.right
                        width: parent.width /3
                        height: parent.height
                        border.color:  "black"
                        radius:  5
                        Text{
                            id: trace
                            x: parent.width * 0.05
                            text: "Type: "
                        }
                        Text{
                            id: cardrace
                            anchors.left: trace.right
                            text: "Racee"
                        }
                    }


                }
                Rectangle{
                   id: id3
                   width: parent.width
                   height: parent.height * 0.2
                   y: id2.y + id2.height
                   Rectangle{
                       id: d1
                       width: parent.width /2
                       height: parent.height
                       border.color:  "black"
                       radius:  5
               Text {
                   id:tatk
                   x: parent.width * 0.05
                   text:("ATK: ")
               }
                Text {
                    id: cardatk
                    anchors.left: tatk.right
                    text:("CardATk")
                }
                   }
                   Rectangle{
                       id: d2
                       width: parent.width /2
                       height: parent.height
                       anchors.left: d1.right
                       border.color:  "black"
                       radius:  5
                       Text {
                           id: tdef
                           x: parent.width * 0.05
                           text:("DEF: ")
                       }
                Text {
                    id: carddef
                    anchors.left: tdef.right
                    text:("CardDef")
                }
                   }
                }

    }
    Rectangle{
        width: parent.width - sizeF
        height:  m1.height
        anchors.left: m1.right
        anchors.bottom: m1.bottom

        radius: 5;
        border.color: "black"
    ScrollView {
        id: descview
        clip: true
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn
        contentHeight: description.height
        anchors.fill: parent

        TextArea {
            id: description
            text: "TextArea\n...\n...\n...\n...\n...\n...\n"
           }
        /*Text {
            id: description
            text: "ABC weqweqweq qweqw qwe"
           //font.pixelSize: 24
        }*/
    }
    }
    function updateCardInfo(id, name, lvl,atk , def, desc, type, atribute, race){
        cardname.text = name;
        cardid.text = id;
        cardlvl.text = lvl;
        cardatk.text = atk;
        carddef.text = def;
        cardrace.text = race;
        cardatr.text = atribute;
        console.log("desc: ", desc)
       var n_desc = desc.split('');
        const lmim = 29;
        const rep  = n_desc.length / lmim;
        for(let i=1; i <=rep; i++){
            n_desc.splice(lmim*i, 0, "\n");
            n_desc.join();
            //n_desc[lmim*i]= '\n'
        }

        description.text = n_desc;

    }

    Connections{

        target: controller

        //function onImgChanged(cmainho){
           // console.log("inside qml OInIMGCHANGED");
           //ibagens.source = cmainho;
        //}

        function onCardAppended(id, name, level,atk, def, desc, type, atribute, race, source){
            // console.log("inside qml OInIMGppended");
           var obj = {"id": id,"name": name,"level": level,"atk":  atk,"def": def,"desc" :desc,"type":  type,"atribute": atribute,"race": race,"source" : source};
           cardModel.append(obj);

        }

        function onRetorno(){
            cardModel.clear();
        }

        function onHideErrorMsg(){
            erroMsg.visible = false;
        }
    }
}
