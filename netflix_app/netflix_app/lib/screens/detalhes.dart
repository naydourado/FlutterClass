import 'package:flutter/material.dart';
import 'package:netflix_app/components/minhaappbar.dart';

class TelaDetalhes extends StatefulWidget {
  String filme;
  TelaDetalhes({super.key, required this.filme});

  @override
  State<TelaDetalhes> createState() => _TelaDetalhesState();
}

class _TelaDetalhesState extends State<TelaDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MinhaAppBar(),
      body: Center(child: Column(
        children: [
          Image.network(widget.filme.split("|")[3], width: 100, height: 100,), //pega a url da imagem do filme
          Text(widget.filme.split("|")[0]), //pega o nome do filme
          Text(widget.filme.split("|")[1]), //pega o ano do filme
          Text(widget.filme.split("|")[2])  //pega a duração do filme
        ])),
        
    );
  }
}
