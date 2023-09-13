import 'package:enterpriser_app/constants.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final String name;
  final String url;
  const ChatPage({super.key, required this.name, required this.url});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List messages = [
    {"messageContent": "Hello, There", "messageType": "receiver"},
    {"messageContent": "Can you do me a project?", "messageType": "receiver"},
    {"messageContent": "Hi ", "messageType": "sender"},
    {"messageContent": "I can do it.", "messageType": "sender"},
    {"messageContent": "ehhhh, fine OK.", " messageType": "receiver"},
    {
      "messageContent": "Can you send the requirements?",
      "messageType": "sender"
    },
  ];
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daak,
      appBar: AppBar(
        elevation: 2,
        automaticallyImplyLeading: false,
        backgroundColor: dark,
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: pink1,
                  ),
                ),
                const SizedBox(
                  width: 2,
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(widget.url),
                  maxRadius: 20,
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: const TextStyle(
                            color: Colors.pink,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        "Online",
                        style: TextStyle(color: Colors.amber, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.settings,
                  color: Colors.pink,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          buildmessage(),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.pink, width: 2),
                color: dark,
              ),
              child: Row(
                children: <Widget>[
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: message,
                      style: const TextStyle(color: Colors.white, fontSize: 20),
                      decoration: const InputDecoration(
                          hintText: "Enter  message...",
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Map a = {
                        "messageContent": message.text,
                        "messageType": "sender"
                      };
                      messages.add(a);
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    label: Text(
                      "Send",
                      style: TextStyle(color: daak),
                    ),
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.pink)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildmessage() {
    var a = Radius.circular(20);
    return ListView.builder(
      itemCount: messages.length,
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 10, bottom: 10),
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
          child: Align(
            alignment: (messages[index]["messageType"] == "receiver"
                ? Alignment.topLeft
                : Alignment.topRight),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: messages[index]["messageType"] == "receiver"
                    ? BorderRadius.only(
                        topLeft: a,
                        topRight: a,
                        bottomRight: a,
                      )
                    : BorderRadius.only(
                        topLeft: a,
                        topRight: a,
                        bottomLeft: a,
                      ),
                color: (messages[index]["messageType "] == "receiver"
                    ? Colors.grey.shade200
                    : Colors.blue[200]),
              ),
              padding: EdgeInsets.all(16),
              child: Text(
                messages[index]["messageContent"],
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}
