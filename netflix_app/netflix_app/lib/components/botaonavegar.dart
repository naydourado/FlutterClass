import 'package:flutter/material.dart';

class BotaoNavegar extends StatelessWidget {
  Function funcao;
  String textoBotao;

  BotaoNavegar({super.key, required this.funcao, this.textoBotao = "Navegar",});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        fixedSize: Size(120, 40),
        backgroundColor: Colors.red, 
        foregroundColor: Colors.white, //cor do texto
      ),
      onPressed: () {funcao();},
      child: Text(textoBotao),
    );
  }
}
