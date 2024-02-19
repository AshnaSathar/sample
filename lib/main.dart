import 'package:flutter/material.dart';
import 'package:flutter_application_1/providerClass.dart';
import 'package:flutter_application_1/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderClass(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Set this to false
        home: const Splash(),
      ),
    );
  }
}
