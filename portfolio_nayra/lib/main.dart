import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_nayra/navigation/navbar.dart';
import 'package:portfolio_nayra/pages/telaHome.dart';
import 'package:portfolio_nayra/style/geral.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {"/": (context) => NavBar(), "/home": (context) => TelaHome()},
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: azulClaro,
        colorScheme: ColorScheme.fromSeed(seedColor: azulEscuro),
      ),
    );
  }
}
