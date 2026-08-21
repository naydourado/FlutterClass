import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final tituloTextos = TextStyle(
  fontSize: 17,
  fontWeight: FontWeight.bold,
);

final container = BoxDecoration(
  border: Border.all(
    color: Colors.grey,
    width: 1,
  ),
  borderRadius: BorderRadius.circular(20),
);

final linhaTitulo = BoxDecoration(
  color: Colors.grey,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      blurRadius: 3,
    ),
  ],
);