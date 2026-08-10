import 'package:flutter/material.dart';

class TelaStack extends StatelessWidget {
  const TelaStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Stack", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 120, height: 120, color: Colors.black),
            Container(width: 60, height: 60, color: Colors.white),
            Container(width: 40, height: 40, color: Colors.blue),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/mix");
              },
              child: Text("Clique Aqui -> Mix"),
            ),
          ],
        ),
      ),
    );
  }
}
