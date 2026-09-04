import 'package:flutter/material.dart';
import 'package:netflix_app/screens/detalhes.dart';
import 'package:netflix_app/screens/home.dart';
import 'package:netflix_app/screens/login.dart';
import 'package:netflix_app/screens/novofilme.dart';

void main() {
  runApp(const MyApp());
}

//Classe Mãe Centralizadora
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => TelaLogin(),
        "/home": (context) => TelaHome(),
        "/novofilme": (context) => TelaNovoFilme(),
      },
    );
  }
}