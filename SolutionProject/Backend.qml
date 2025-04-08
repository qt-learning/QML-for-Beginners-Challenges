pragma Singleton
import QtQuick

QtObject {
    id: root

    property int currentIndex: 0

    property var chat: chatModel[currentIndex]["chat"]
    readonly property string chattingWith: chatModel[currentIndex]["name"]
    readonly property color myColor: Qt.color("orange")
    readonly property color theirColor: Qt.color(chatModel[currentIndex]["theirColor"])

    function addReply(me: bool, text: string) {
        let chatEntry = {me: me, text: text}
        chat.push(chatEntry)
        chat = Qt.binding(function() { return chatModel[currentIndex]["chat"] })
    }

    readonly property var chatModel: [
        {
            name: "Bob",
            theirColor: "lightblue",
            chat: [
                { me: false, text: "Hi Mike!" },
                { me: true,  text: "hey Bob, how's it going? It's been a while!" },
                { me: false, text: "Great thanks! Want to go out for a steak?" },
                { me: true,  text: "You don't have to ask me twice! What time and where?" },
                { me: false, text: "The Red Meat Shack at 7pm?" },
                { me: true,  text: "Done! Medium well ;-)"},
            ]
        },
        {
            name: "Alice",
            theirColor: "pink",
            chat: [
                { me: true,  text: "Hey Alice, have you been able to finish that report?" },
                { me: false, text: "The report is almost ready" },
                { me: false, text: "It'll be with you first thing in the morning" },
                { me: true,  text: "Brilliant - thanks for doing that" },
                { me: false, text: "No Problem" }
            ]
        },
        {
            name: "John",
            theirColor: "lightgreen",
            chat: [
                { me: false, text: "The new model is out - did you get to see it?" },
                { me: true,  text: "I had a go with it at the expo" },
                { me: false, text: "The stock is limited at the store so you have to be quick" },
                { me: true,  text: "Really? OK, I'd better get on to that quickly!" }
            ]
        }
    ]
}
