import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// CORES
const corPrimaria = Color(0XFF387464);
const corSecundaria = Colors.blueAccent;
const corTerciaria = Colors.white;

// TAMANHO DO CONTAINER / ESPAÇAMENTOS
const tamanho = 20.0;
const espacamento = EdgeInsets.all(20);

// TEXTOS
final titulo = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: corTerciaria,
    fontFamily: GoogleFonts.poppins().fontFamily
);

// utilizamos final para estilos de componentes, porque o aplicativo vai verificar 
// se o componente existe e depois aplica a estilização.

// BOTÕES
final estiloBotao = TextButton.styleFrom(
    backgroundColor: corPrimaria,
    foregroundColor: corTerciaria,
    fixedSize: Size(200, 50),
);