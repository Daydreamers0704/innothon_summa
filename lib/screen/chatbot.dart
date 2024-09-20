import 'package:flutter/material.dart';



class ChatBotApp extends StatefulWidget {
  final int selectedIndex;

  const ChatBotApp({Key? key, required this.selectedIndex}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatBotApp> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = [];
  final List<String> _previousChats = ["Previous Chat 1", "Previous Chat 2"];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(_controller.text);
      });
      _controller.clear();
    }
  }

  void _loadPreviousChat(String chat) {
    setState(() {
      _messages.clear();
      _messages.addAll(["Loaded $chat message 1", "Loaded $chat message 2"]);
    });
    Navigator.of(context).pop(); // Close the drawer when chat is selected
  }

  void _micButtonPressed() {
    print("Mic button pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Row(
          children: [
            Text(
              "ChatBot",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                  'assets/moodmotion.jpg'), // Replace with your image path
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Text(
                'Previous Chats',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            for (String chat in _previousChats)
              ListTile(
                title: Text(chat),
                onTap: () => _loadPreviousChat(chat),
              ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ListView.builder(
                shrinkWrap: true,
                reverse: true, // To stack messages from bottom to top
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[_messages.length - 1 - index];

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.deepPurpleAccent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.amberAccent,
                            width: 1.5,
                          ),
                        ),
                        child: Text(
                          message,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type a message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                          color: Colors.deepPurpleAccent,
                        ),
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      suffixIcon: IconButton(
                        icon: Icon(Icons.mic, color: Colors.deepPurpleAccent),
                        onPressed: _micButtonPressed,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                FloatingActionButton(
                  onPressed: _sendMessage,
                  backgroundColor: Colors.deepPurpleAccent,
                  child: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
