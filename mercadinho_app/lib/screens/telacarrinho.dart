import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/screens/telalogin.dart';

class TelaCarrinho extends StatefulWidget {
  const TelaCarrinho({super.key});

  @override
  State<TelaCarrinho> createState() => _TelaCarrinhoState();
}

class _TelaCarrinhoState extends State<TelaCarrinho> {
  double total = 0;

  void aumentar(dynamic produto) {
    setState(() {
      produto.quantidade++;
    });
  }

  void diminuir(dynamic produto) {
    setState(() {
      if (produto.quantidade > 1) {
        produto.quantidade--;
      } else {
        produtosCarrinho.remove(produto);
      }
    });
  }

  double somarTotal() {
    double soma = 0;
    for (dynamic produto in produtosCarrinho) {
      soma += produto.preco * produto.quantidade;
    }
    total = soma;
    return total;
  }

  void fazerPost() async {
    dynamic itensPedido = produtosCarrinho.map((produto) {
      return {"Nome do produto": produto.nome, "quantidade": produto.quantidade};
    }).toList();

    final respostaServidor = await http.post(
      Uri.parse("https://api-mercadinho-qnkj.onrender.com/pedidos"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "usuarioId": usuarioId,
        "total": total,
        "itens": itensPedido,
      }),
    );

    if (respostaServidor.statusCode == 201) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Dado criado com sucesso")));
        setState(() {
          produtosCarrinho.clear();
          total = 0;
        });
      }
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Erro ao criar pedido")));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carrinho de Compras"),
        automaticallyImplyLeading: false,
      ),
      body: produtosCarrinho.isEmpty
          ? Center(
              child: Text("Adicione produtos na tela Home \n Carrinho Vazio!"),
            )
          : ListView(
              children: [
                for (final produto in produtosCarrinho)
                  ListTile(
                    leading: Image.network(produto.urlImagem),
                    title: Text(produto.nome),
                    subtitle: Text("R\$ ${produto.preco.toStringAsFixed(2)}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              produtosCarrinho.remove(produto);
                            });
                          },
                          icon: Icon(Icons.delete),
                        ),
                        IconButton(
                          onPressed: () {
                            diminuir(produto);
                          },
                          icon: Icon(Icons.remove),
                        ),
                        Text(produto.quantidade.toString()),
                        IconButton(
                          onPressed: () {
                            aumentar(produto);
                          },
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),
                Text("Total da sua compra: R\$ ${somarTotal().toStringAsFixed(2)}"),
                TextButton(
                  onPressed: () {
                    fazerPost();
                  },
                  child: Text("Salvar"),
                ),
              ],
            ),
    );
  }
}

List produtosCarrinho = [];
