import 'package:flutter/material.dart';
import 'package:flutter_application_1/home.dart';
import 'package:flutter_application_1/providerClass.dart';
import 'package:provider/provider.dart';

class Register extends StatelessWidget {
  const Register({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  border: OutlineInputBorder(),
                ),
                controller: nameController,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    String userName = nameController.text;
                    ProviderClass provider =
                        Provider.of<ProviderClass>(context, listen: false);

                    if (provider.users.contains(userName)) {
                      print("Name already exists");
                    } else {
                      provider.userlistUpdate(user: userName);
                      if (provider.statuscode) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(userName: userName),
                          ),
                        );
                      } else {
                        print("Failed");
                      }
                    }
                  },
                  child: Text("Register"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
