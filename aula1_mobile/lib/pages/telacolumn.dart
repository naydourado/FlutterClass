import 'package:flutter/material.dart';
import 'package:aula1_mobile/style/geral.dart';

class TelaColumn extends StatelessWidget {
  const TelaColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Column", style: titulo),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20, //igual o gap
          children: [
            Container(width: tamanho, height: tamanho, color: Colors.blue),
            Container(width: tamanho, height: tamanho, color: Colors.black),
            Container(width: tamanho, height: tamanho, color: Colors.red),
            TextButton(
              style: estiloBotao,
              onPressed: () {
                Navigator.pushNamed(context, "/row");
              },
              child: Text("Clique Aqui -> Row"),
            ),
          ],
        ),
      ),
    );
  }
}
