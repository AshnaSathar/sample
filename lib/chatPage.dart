import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  final String receiverName;

  const ChatPage({Key? key, required this.receiverName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverName),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              reverse: true, // To display messages from bottom to top
              padding: EdgeInsets.all(8.0),
              children: [
                // Example receiver message
                ReceiverMessage(message: 'Hello!'),
                // Example sender message
                SenderMessage(message: 'Hi there!'),
                // Add more messages as needed
              ],
            ),
          ),
          _buildInputBox(),
        ],
      ),
    );
  }

  Widget _buildInputBox() {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message...',
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              // Implement sending message logic here
            },
          ),
        ],
      ),
    );
  }
}

class ReceiverMessage extends StatelessWidget {
  final String message;

  const ReceiverMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Text(message),
      ),
    );
  }
}

class SenderMessage extends StatelessWidget {
  final String message;

  const SenderMessage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Text(message),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ChatPage(receiverName: 'ReceiverName'),
  ));
}
