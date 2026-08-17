import 'package:flutter/material.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 230,
                  height: 230,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue, width: 4.0),
                    image: const DecorationImage(
                      image: AssetImage('assets/nayra.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                const SizedBox(width: 30),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5,
                  children: [
                    const Text(
                      "Olá,",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                      ),
                    ),
                    const Text(
                      "seja bem-vindo(a) ao meu Portfolio.\n"
                      "Eu sou Nayra Dourado Oliveira.",
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 40),

            Column(
              children: [
                const Text("Tecnologias"),
                Column(children: []),
              ],
            ),

            const SizedBox(height: 40),

            Column(
              children: [
                const Text("Curiosidades"),
                Row(
                  children: [
                    Container(
                      width: 200,
                      height: 150,
                      color: const Color(0xffe4fcf0),
                      child: const Column(   
                        crossAxisAlignment: CrossAxisAlignment.start,                                
                        children: [
                          Icon(Icons.cookie),
                          Text("Cookie"),
                          Text(
                            "Não continuo uma linha de código sem "
                            "dar uma beliscadinha.",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
