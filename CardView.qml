import QtQuick
import QtQuick.Controls
import QtQml.Models
Item {
    anchors.fill: parent

    ListModel {
        id: cardModel
        /*ListElement { source: "https://images.ygoprodeck.com/images/cards/26932788.jpg" }
        ListElement { source: "https://images.ygoprodeck.com/images/cards/5405694.jpg" }
        ListElement { source: "https://images.ygoprodeck.com/images/cards/3627449.jpg" }
*/
    }



    Rectangle{
        width: parent.width
        height: parent.height *0.8
        y: parent.height * 0.1
        color: "Orange"
        SwipeView {
            id: view

            currentIndex: 0
            anchors.fill: parent
            Repeater {
                    model: cardModel
                    Loader {
                        //active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                        sourceComponent: Image {

                            source:  model.source
                            Component.onCompleted: console.log("created:", index, model.source)
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


        /*Image {
            id: ibagens
             anchors.fill: parent
             source: ""

          }*/
    }



    Connections{

        target: carta

        //function onImgChanged(cmainho){
           // console.log("inside qml OInIMGCHANGED");
           //ibagens.source = cmainho;
        //}

        function onImgAppended(url){
             console.log("inside qml OInIMGppended");
           var obj = {"source" : url};
           cardModel.append(obj);
        }
    }
}
