import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class ProviderClass extends ChangeNotifier {
  List<String> users = [];
  var statuscode = false;
  late io.Socket socket;

  ProviderClass() {
    _initSocketConnection();
  }

  Future<void> _initSocketConnection() async {
    socket = io.io('http://your-node-server-ip:3000', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

    socket.onConnect((_) {
      print('Connected: ${socket.id}');
      // Join private chat when connected
      _joinPrivateChat('UserA');
    });

    socket.on('privateMessage', (data) {
      print('Received private message: $data');
      // Handle incoming private messages
    });
  }

  void _joinPrivateChat(String userId) {
    socket.emit('joinPrivateChat', userId);
  }

  void sendPrivateMessage(String receiverUserId, String message) {
    socket.emit('privateMessage', {
      'receiverUserId': receiverUserId,
      'message': message,
    });
  }

  Future<void> userlistUpdate({required String user}) async {
    print(user);
    if (users.contains(user)) {
      statuscode = false;
    } else {
      statuscode = true;
      users.add(user);
    }
    print("this is the users ${users.first}");
    notifyListeners();
  }
}
