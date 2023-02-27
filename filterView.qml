import QtQuick
import QtQuick.Controls
Item {
    anchors.fill: parent

    Rectangle{
        width: parent.width
        height: parent.height *0.8
        y: parent.height * 0.1
        color: "lightblue"
    Column {
        ComboBox {
            width: 200
            model: ["", "Dark", "Light", "Earth", "Water", "Fire", "Wind", "Divine" ]
        }


        ComboBox {
            width: 200
            model: ["",'Skill Card', 'Spell Card', 'Trap Card', 'Normal Monster', 'Normal Tuner Monster', 'Effect Monster', 'Tuner Monster', 'Flip Monster', 'Flip Effect Monster', 'Flip Tuner Effect Monster', 'Spirit Monster', 'Union Effect Monster', 'Gemini Monster', 'Pendulum Effect Monster', 'Pendulum Normal Monster', 'Pendulum Tuner Effect Monster', 'Ritual Monster', 'Ritual Effect Monster', 'Toon Monster', 'Fusion Monster', 'Synchro Monster', 'Synchro Tuner Monster', 'Synchro Pendulum Effect Monster', 'XYZ Monster', 'XYZ Pendulum Effect Monster', 'Link Monster', 'Pendulum Flip Effect Monster', 'Pendulum Effect Fusion Monster' , 'Token' ]
        }


        ComboBox {
            width: 200
            model: ["",'continuous', 'zombie', 'fiend', 'normal', 'quick-play', 'rock', 'warrior', 'winged beast', 'spellcaster', 'beast', 'fairy', 'equip', 'field', 'fish', 'beast-warrior', 'thunder', 'machine', 'sea serpent', 'aqua', 'plant', 'dragon', 'reptile', 'counter', 'psychic', 'insect', 'pyro', 'dinosaur', 'wyrm', 'cyberse', 'ritual', 'divine-beast', 'creator-god', 'cyverse', 'mai', 'pegasus', 'ishizu', 'joey', 'kaiba', 'yugi'] }
    }
    }
}
