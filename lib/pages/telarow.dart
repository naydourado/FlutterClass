import 'package:flutter/material.dart';

class TelaRow extends StatelessWidget {
  const TelaRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Row", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/");
              },
              child: Text("Voltar"),
            ),
            Container(width: 20, height: 20, color: Colors.blue),
            Container(width: 20, height: 20, color: Colors.red),
            Container(width: 20, height: 20, color: Colors.black),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/stack");
              },
              child: Text("Clique Aqui -> Stack"),
            ),
          ],
        ),
      ),
    );
  }
}
