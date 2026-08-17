import 'package:aula1_mobile/navigation/navbar.dart';
import 'package:aula1_mobile/pages/telacolumn.dart';
import 'package:aula1_mobile/pages/telamix.dart';
import 'package:aula1_mobile/pages/telamixvini.dart';
import 'package:aula1_mobile/pages/telarow.dart';
import 'package:aula1_mobile/pages/telastack.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  //funcao principal
  runApp(const MyApp()); //funcao que roda o app
}

//classe mãe - classe separada que contém todas as configurações gerais do App
// st - abre catálogo

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //fornece os componentes para as telas & faz a configuração geral do App
      initialRoute: "/",
      routes: {
        "/": (context) => NavBar(),
        "/column": (context) => TelaColumn(),
        "/row": (context) => TelaRow(),
        "/stack": (context) => TelaStack(),
        "/mix": (context) => TelaMix(),
        "/mixvini": (context) => TelaMixVini(),
      },
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
    );
  }
}
