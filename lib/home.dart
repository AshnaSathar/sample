import 'package:flutter/material.dart';
import 'package:flutter_application_1/chatPage.dart';
import 'package:flutter_application_1/login.dart';
import 'package:flutter_application_1/providerClass.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final String userName;
  const Home({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    print(this.userName);
    print(Provider.of<ProviderClass>(context).users);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          this.userName,
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).popUntil((route) => route.isFirst);

                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Login(),
                    ));
              },
              child: Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
        itemCount: Provider.of<ProviderClass>(context).users.length,
        itemBuilder: (context, index) {
          String recievername =
              Provider.of<ProviderClass>(context).users[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChatPage(receiverName: recievername),
                  ));
            },
            child: Container(
                height: 50,
                color: Colors.grey,
                child: Text(Provider.of<ProviderClass>(context).users[index])),
          );
        },
      ),
    );
  }
}
