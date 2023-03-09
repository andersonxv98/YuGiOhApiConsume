import QtQuick
import QtQuick.Controls
Item {
    anchors.fill: parent
    Rectangle{
        width: parent.width
        height: parent.height * 0.10
        color: "Orange"
        Text {
            id: labelLanguage
            text: qsTr("Language: ")
            //font.pointSize: 24

        }
        ComboBox {
            x: labelLanguage.width
            width: parent.width * 0.4
            height: labelLanguage.height
            model: ['English',  'Portuguese' ,'French', 'German', 'Italian'  ]
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
