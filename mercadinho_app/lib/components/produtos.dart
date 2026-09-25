import 'package:flutter/material.dart';
import 'package:mercadinho_app/screens/telacarrinho.dart';

class ProdutosCard extends StatelessWidget {
  String nome;
  double preco;
  String urlImagem;
  int quantidade;

  ProdutosCard({super.key, required this.nome, required this.preco, required this.urlImagem, this.quantidade = 1});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(children: [
        Image.network(urlImagem, width: 70),
        Text(nome, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        Text("R\$ ${preco.toStringAsFixed(2)}", style: TextStyle(fontSize: 13)),
        IconButton(onPressed: () {
          final index = produtosCarrinho.indexWhere((item) => item.nome == nome);
          if (index == -1) {
            produtosCarrinho.add(ProdutosCard(nome: nome, preco: preco, urlImagem: urlImagem));
          } else {
            produtosCarrinho[index].quantidade++;
          }
        }, icon: Icon(Icons.add_shopping_cart))
      ],),
    );
  }
}
