import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const azulClaro = Color(0xffeaf6ff);
const azulClaroBotao = Color(0xffdceeff);
const azulEscuro = Color(0xff164a7b);

final tituloTextos = TextStyle(
  fontFamily: GoogleFonts.fraunces().fontFamily,
  fontSize: 17,
  fontWeight: FontWeight.bold,
  color: azulEscuro,
);

final tituloTextosProjetos = TextStyle(
  fontFamily: GoogleFonts.fraunces().fontFamily,
  fontSize: 35,
  fontWeight: FontWeight.bold,
  color: azulEscuro,
);

final container = BoxDecoration(
  border: Border.all(
    color: azulEscuro,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(20),
);

final linhaTitulo = BoxDecoration(
  color: azulEscuro,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 3,
    ),
  ],
);