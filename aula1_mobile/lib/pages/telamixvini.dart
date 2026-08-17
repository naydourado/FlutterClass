import 'package:flutter/material.dart';

class TelaMixVini extends StatelessWidget {
  const TelaMixVini({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela Mix")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment
            .start, //eixo secundário, para deixar (nesse caso), tudo na esquerda
        spacing: 30,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDdWOlp2pszaLTlNpoaWvR4f6x7bY7tucASUeqJTRvpA&s=10",
                width: double.infinity,
                height: 200,
              ),
              Container(
                width: 100,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              Text(
                "Meu Perfil",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Text("Atalho", style: TextStyle(fontWeight: FontWeight.bold)),
          Row(spacing: 30, children: [Icon(Icons.menu_book), Text("Aulas")]),

          Text("Conteúdo", style: TextStyle(fontWeight: FontWeight.bold)),
          Row(
            spacing: 30,
            children: [
              Image.asset("assets/ragdoll.jpg", width: 200),
              Text("Introdução a Flutter"),
            ],
          ),
        ],
      ),
    );
  }
}
