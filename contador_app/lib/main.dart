import 'package:contador_app/screens/telacontador.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp( //CupertinoApp --> Cara de IOS
      initialRoute: "/",
      routes: {
        "/":(context) => TelaContador(),

      },
    );
  }
}