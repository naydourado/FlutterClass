import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mercadinho_app/components/inputlogin.dart';
import 'package:mercadinho_app/screens/telalogin.dart';

class TelaPerfil extends StatefulWidget {
  const TelaPerfil({super.key});

  @override
  State<TelaPerfil> createState() => _TelaPerfilState();
}

class _TelaPerfilState extends State<TelaPerfil> {
  TextEditingController emailDigitado = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailDigitado.text = usuarioEmail ?? "";
  }

  void fazerPatch() async {
    final respostaServidor = await http.patch(
      Uri.parse("https://api-mercadinho-qnkj.onrender.com/usuarios/$usuarioId"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"email": emailDigitado.text}),
    );
    if (respostaServidor.statusCode == 200) {
      setState(() {
        usuarioEmail = emailDigitado.text;
      });
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Dado alterado com sucesso!")));
      } else {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Erro ao atualizar dado!"),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  void finalizarSessao() {
    usuarioId = null;
    usuarioEmail = null;
    // usamos o pushAndRemoveUntil para apagar todas as rotas anteriores e criar um novo contexto de navegação, evitando que o usuário volte para a tela de perfil após deslogar
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => TelaLogin()), (route) => false);
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
            Text("Informações do Perfil", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.orange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.person, size: 120),
            SizedBox(height: 30),
            InputLogin(fofoqueira: emailDigitado, placeholder: "Digite o email"),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () { fazerPatch(); },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange, foregroundColor: Colors.white),
              child: Text("Alterar"),
            ),
            TextButton(
              onPressed: () { finalizarSessao(); },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: Text("Sair"),
            ),
          ],
        ),
      ),
    );
  }
  }