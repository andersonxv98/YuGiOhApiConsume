import QtQuick
import QtQuick.Controls
Item {
    anchors.fill: parent
    Rectangle{
        id: header_
        width: parent.width
        height: parent.height * 0.10
        color: "#2E3033"
        radius: 5
        Text {
            id: labelLanguage
            text: qsTr("Language: ")
            color: "#E1EBFA"
            font.pointSize: header_.height * 0.27
            x: parent.width * 0.03
        }
        ComboBox {
            id: cbHeader
            x: labelLanguage.width + labelLanguage.x
            width: header_.width - (labelLanguage.width + (labelLanguage.x * 2))
            height: labelLanguage.height
            font.pointSize: header_.height * 0.2
            //color: "black"
            model: ['English',  'Portuguese' ,'French', 'German', 'Italian'  ]
            background: Rectangle {
                   color:"#5b5f6a"
                   radius: 5
               }
            contentItem: Text {
                  leftPadding: 0
                  //rightPadding: cbHeader.indicator.width + control.spacing

                  text: cbHeader.displayText
                  font: cbHeader.font
                  color: cbHeader.pressed ? "#e1f8fa" : "#E1EBFA"
                  verticalAlignment: Text.AlignVCenter
                  elide: Text.ElideRight
              }



              /*popup: Popup {
                  y: cbHeader.height - 1
                  width: cbHeader.width
                  implicitHeight: contentItem.implicitHeight
                  padding: 1

                  contentItem: ListView {
                      clip: true
                      implicitHeight: contentHeight
                      model: cbHeader.popup.visible ? cbHeader.model : null
                      currentIndex: cbHeader.highlightedIndex

                      ScrollIndicator.vertical: ScrollIndicator { }
                  }

                  background: Rectangle {
                      border.color: "white"
                      radius: 2
                  }
              }*/
                //Material.accent: "green"
                //Material.foreground: "blue"


            onCurrentIndexChanged: {
                 var lang = "";
                switch (currentIndex) {
                    case 1: // nenhuma instrução break em 'case 0:' então essa instrução vai rodar também
                        lang = "pt"
                        break; // o programa encontra esse break então não vai continuar para o 'case 2:'
                    case 2:
                         lang = "fr"
                        break;
                    case 3:
                         lang = "de"
                        break;
                    case 4:
                        lang = "it"
                        break;
                    default:

                }
                controller.setLang(lang);

            }
        }
    }

    Connections{
        target: controller
    }
}
