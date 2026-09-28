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
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.network("https://cdn-icons-png.flaticon.com/512/6680/6680292.png", width: 24, height: 24),
            ),
            SizedBox(width: 8),
            Text("Carrinho de Compras", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
      ),
      body: produtosCarrinho.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Carrinho vazio",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Adicione produtos na tela Home"),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(context, "/navbar", (route) => false);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
                    child: Text("Ir para Home"),
                  ),
                ],
              ),
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
                Divider(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total da sua compra",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "R\$ ${somarTotal().toStringAsFixed(2)}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange.shade800),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      fazerPost();
                    },
                    child: Text("Salvar"),
                  ),
                ),
              ],
            ),
    );
  }
}

List produtosCarrinho = [];
