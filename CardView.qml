import QtQuick
import QtQuick.Controls
import QtQml.Models
//import QtQuick.Controls.Styles 1.0

Item {
    anchors.fill: parent
    property double sizeF:getHeigth()? parent.width * 0.6: parent.width *0.3 ;
    property Gradient backColor:  Gradient {
        GradientStop { position: 0.0; color: "#373940" }
        //GradientStop { position: 0.33; color: "yellow" }
        GradientStop { position: 1.0; color: "#000000" }
    }
        property string textColor: "#CCD3ED"
    property string borderStyle: "#5E626E"
    ListModel {
        id: cardModel
    }

    Rectangle{
        id: imagev
        width: getWidth()? parent.width / 3: parent.width ;
        height: getHeigth()? parent.height *0.70 : parent.height * 0.9 ;//
        color: "black"




        TextArea {
            id: erroMsg
            text: qsTr("No cards match your search!\n please check that there are no filter conflicts")
            font.pointSize: 14
            color: textColor
            visible: false
            background: Rectangle {
                color: "transparent"
            }



        }
        Connections{
            target: rq

            function onError(){
                erroMsg.visible = true;
                msgSearch.visible = false;
                clearInfoValues();
            }
        }

        SwipeView {
            id: view
            width: imagev.width
            height: imagev.height
            currentIndex: -1
            anchors.fill: parent
            clip: true
            onCurrentIndexChanged: {
                var obj_card = cardModel.get(view.currentIndex);
                //descriptionlist.clear()
                //ldescview.currentIndex = 0;
                updateCardInfo(obj_card.name, obj_card.level, obj_card.atk, obj_card.def, obj_card.desc, obj_card.type, obj_card.atribute, obj_card.race);

            }

            Repeater {
                    model: cardModel
                    Loader {

                        sourceComponent:
                            Image {
                               source:  model.source
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
        width: getHeigth()? sizeF : imagev.width;
        height: getHeigth()? parent.height *0.3: parent.height;
        y: getHeigth()? imagev.y + imagev.height: imagev.y;
        x: getWidth()? imagev.x + imagev.width: imagev.x;
        gradient:  backColor
                Rectangle{
                    id: id1
                    width: parent.width
                    height: parent.height * 0.1
                    color: 'transparent'
                    Rectangle{
                        id: r1
                        width: parent.width
                        height: parent.height
                        color: 'transparent'
                        border.color:  borderStyle
                        radius:  5
                        Text {
                            id: lbName
                            x: parent.width * 0.05
                            text: qsTr("Name: ")
                            color: textColor
                        }
                        Text {
                            id: cardname
                            anchors.left: lbName.right
                            text:("CardName")
                            color: textColor
                        }
                    }

                }
                Rectangle{
                    id: id2
                    width: parent.width
                    height: parent.height * 0.2
                   color: 'transparent'
                    y: id1.height
                    Rectangle{
                        id: c1
                        width: parent.width /3
                        height: parent.height
                        color: 'transparent'
                        border.color:  borderStyle
                        radius:  5
                        Text{
                            id: tlvl

                            x: parent.width * 0.05
                            text: "Level: "
                            color: textColor
                        }
                        Text{
                            id: cardlvl
                            anchors.left: tlvl.right
                            text: "level"
                            color: textColor
                        }
                    }
                    Rectangle{
                        id: c2
                        anchors.left: c1.right
                        width: parent.width /3
                        height: parent.height
                        color: 'transparent'
                        border.color:  borderStyle
                       radius: 5
                        Text{
                            id: tatr
                            x: parent.width * 0.05
                            text: "Attribute: "
                            color: textColor
                        }
                        Text{
                            id: cardatr
                            anchors.left: tatr.right
                            text: "atr"
                            color: textColor
                        }
                    }
                    Rectangle{
                        id: c3
                        anchors.left: c2.right
                        width: parent.width /3
                        height: parent.height
                        color: 'transparent'
                        border.color: borderStyle
                        radius:  5
                        Text{
                            id: trace
                            x: parent.width * 0.05
                            text: "Type: "
                            color: textColor
                        }
                        Text{
                            id: cardrace
                            anchors.left: trace.right
                            text: "Racee"
                            color: textColor
                        }
                    }


                }
                Rectangle{
                   id: id3
                   width: parent.width
                   height: parent.height * 0.2
                   color: 'transparent'
                   y: id2.y + id2.height
                   Rectangle{
                       id: d1
                       width: parent.width /2
                       height: parent.height
                       color: 'transparent'
                       border.color:  borderStyle
                       radius:  5
               Text {
                   id:tatk
                   x: parent.width * 0.05
                   text:("ATK: ")
                   color: textColor
               }
                Text {
                    id: cardatk
                    anchors.left: tatk.right
                    text:("CardATk")
                    color: textColor
                }
                   }
                   Rectangle{
                       id: d2
                       width: parent.width /2
                       height: parent.height
                       anchors.left: d1.right
                       color: 'transparent'
                       border.color:  borderStyle
                       radius:  5
                       Text {
                           id: tdef
                           x: parent.width * 0.05
                           text:("DEF: ")
                           color: textColor
                       }
                Text {
                    id: carddef
                    anchors.left: tdef.right
                    text:("CardDef")
                    color: textColor
                }
                   }
                }

                Text{
                    id: msgSearch
                    text: "Please wait while i get all correspondents cards\nSwipe view may have issues until finish";
                    color: textColor
                    //visible: false
                    y: id3.y + id3.height

                    ColorAnimation on color{
                        loops: Animation.Infinite
                        to: "#D4AFFA"
                        duration: 300
                    }
                }

    }
    Rectangle{
        width:getHeigth()? parent.width - sizeF: imagev.width;
        height:  m1.height
        anchors.left: m1.right
        anchors.bottom: m1.bottom
        color: 'black'
        radius: 5;
        border.color:borderStyle
    ScrollView {
        id: descview
        clip: true
        //ScrollBar.vertical.policy: ScrollBar.AlwaysOn

        contentHeight: description.height
        anchors.fill: parent

        TextArea {
            id: description
            text: "TextArea\n...\n...\n...\n...\n...\n...\n"
            font.pointSize: descview.width * 0.04
            background: Rectangle {
                gradient:  backColor
            }
           /* style: TextAreaStyle {
                   textColor: textColor

                   backgroundColor: "transparent"
               }*/
           }
        /*Text {
            id: description
            text: "ABC weqweqweq qweqw qwe"
           //font.pixelSize: 24
        }*/
    }
    }
    function updateCardInfo( name, lvl,atk , def, desc, type, atribute, race){
        cardname.text = name;
        //cardid.text = id;
        cardlvl.text = lvl;
        cardatk.text = atk;
        carddef.text = def;
        cardrace.text = race;
        cardatr.text = atribute;      
       var n_desc = desc.split('');
        const lmim = 29;
        const rep  = n_desc.length / lmim;
        for(let i=1; i <=rep; i++){
            n_desc.splice(lmim*i, 0, "\n");
            n_desc.join();
            //n_desc[lmim*i]= '\n'
        }

        description.text = n_desc;
        description.color = textColor

    }

    Connections{

        target: controller

        //function onImgChanged(cmainho){

           //ibagens.source = cmainho;
        //}
        function onstartSearch(){
             msgSearch.visible = true;
        }
        function onEndSearch(){
            msgSearch.visible = false;
        }
        function onCardAppended(id, name, level,atk, def, desc, type, atribute, race, source){

           var obj = {"id": id,"name": name,"level": level,"atk":  atk,"def": def,"desc" :desc,"type":  type,"atribute": atribute,"race": race,"source" : source};
           cardModel.append(obj);

        }

        function onRetorno(){
            cardModel.clear();
            msgSearch.visible = true;
        }

        function onHideErrorMsg(){
            erroMsg.visible = false;

        }
    }

    function getWidth(){
        let r = false;
        if(parent.width > parent.height){
        r= true;
        }
        return r;
    }

    function getHeigth(){
        let r = false;
        if(parent.height > parent.width){
            r = true;
        }
        return r;
    }

    function clearInfoValues(){
        cardname.text = "";
        cardlvl.text = "";
        cardatk.text = "";
        carddef.text = "";
        cardrace.text = "";
        cardatr.text = "";

        description.text = "";

    }
}
