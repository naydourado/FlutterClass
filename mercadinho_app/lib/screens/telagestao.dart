import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TelaGestao extends StatefulWidget {
  const TelaGestao({super.key});

  @override
  State<TelaGestao> createState() => _TelaGestaoState();
}

class _TelaGestaoState extends State<TelaGestao> {
  TextEditingController nomeDigitado = TextEditingController();
  TextEditingController urlDigitado = TextEditingController();
  TextEditingController precoDigitado = TextEditingController();
  List listaProdutos = [];

  @override
  void initState() {
    super.initState();
    fazerGet();
  }

  void fazerPost() async {
    final respostaServidor = await http.post(Uri.parse("https://api-mercadinho-qnkj.onrender.com/produtos"), 
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "nome": nomeDigitado.text,
      "imagem": urlDigitado.text,
      "preco": double.parse(precoDigitado.text),
    })
    );  

    if(mounted){
      if(respostaServidor.statusCode == 201){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Produto criado com sucesso!"))
          );
          Navigator.pushNamed(context, "/navbar");
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao criar produto, tente novamente!", style: TextStyle(color: Colors.white),), backgroundColor: Colors.red,)
          );
      }
    }
  }

  void fazerGet() async {
    final respostaServidor = await http.get(Uri.parse("https://api-mercadinho-qnkj.onrender.com/produtos"));
    if(respostaServidor.statusCode == 200){
      final dados = jsonDecode(respostaServidor.body);
      setState(() {
        listaProdutos = dados;
      });
    }else{
      if(mounted){ //mounted verifica se a lógica/página foi montada antes de aparecer uma mensagem de erro
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Erro ao carregar dados!"), backgroundColor: Colors.red,)
        );
      }
    }
  }

  void fazerDelete(dynamic id) async {
    final respostaServidor = await http.delete(Uri.parse("https://api-mercadinho-qnkj.onrender.com/produtos/$id"));
    if(respostaServidor.statusCode == 200){
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Dado deletado com sucesso!"))
        );
        fazerGet(); //atualiza dados em tempo real, chamando a função de GET novamente
        Navigator.pushNamed(context, "/navbar"); //atualiza a página de gestão
      }
    }else{
      if(mounted){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Falha ao deletar dado!"), backgroundColor: Colors.red,)
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tela de Gestão")),
      body: ListView(
        children: [
          TextField(controller: nomeDigitado, decoration: InputDecoration(hintText: "Insira o nome do produto"),),
          TextField(controller: urlDigitado, decoration: InputDecoration(hintText: "Insira a URL do produto"),),
          TextField(controller: precoDigitado, decoration: InputDecoration(hintText: "Insira o preço do produto"),),
          TextButton(onPressed: fazerPost, child: Text("Salvar")),
          SizedBox(height: 100,),
          Divider(indent: 15, endIndent: 15),
          for (final produto in listaProdutos)
            ListTile(
              title: Text(produto["nome"]),
              subtitle: Text(produto["preco"].toStringAsFixed(2)),
              trailing: IconButton(
                onPressed: () => fazerDelete(produto["id"]),
                icon: Icon(Icons.delete, color: Colors.red),
              ),
            ),
        ],
      ),
    );
  }
}