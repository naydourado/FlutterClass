import 'package:flutter/material.dart';
import 'package:portfolio_nayra/style/geral.dart';

class TelaInsight extends StatefulWidget {
  const TelaInsight({super.key});

  @override
  State<TelaInsight> createState() => _TelaInsightState();
}

class _TelaInsightState extends State<TelaInsight> {
  int curtidas = 0;
  bool curtiu = false;
  int projetoAtual = 0;

  final List projetos = [
    {
      "nome": "AutAI",
      "categoria": "HACKATHON",
      "descricao":
          "Priorização inteligente orientada por IA com chatbot integrado para suporte ao usuário.",
      "imagem": "assets/autai.jpg",
    },
    {
      "nome": "PBI Performance FTL",
      "categoria": "PROJETO DE ÁREA",
      "descricao":
          "Dashboard para análise de desempenho de transportadoras da Bosch.",
      "imagem": "assets/rodoviario.png",
    },
    {
      "nome": "E-learn",
      "categoria": "TCC",
      "descricao":
          "Plataforma para controle de atividades, gerenciamento e uploads de materiais [Em desenvolvimento].",
      "imagem": "assets/e-learn.png",
    },
  ];

  void curtirProjeto() {
    setState(() {
      if (curtiu == false) {
        curtidas++;
        curtiu = true;
      } else {
        curtidas--;
        curtiu = false;
      }
    });
  }

  void proximoProjeto() {
    setState(() {
      if (projetoAtual < projetos.length - 1) {
        projetoAtual++;
      } else {
        projetoAtual = 0;
      }

      curtidas = 0;
      curtiu = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "N A Y R A   D O U R A D O",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                ),

                Text(
                  "P O R T F O L I O",
                  style: TextStyle(
                    fontSize: 14,
                    color: azulEscuro,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 35),

            Container(
              width: 500,
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Column(
                children: [
                  Image.asset(
                    projetos[projetoAtual]["imagem"],
                    width: 450,
                    height: 250,
                    fit: BoxFit.cover,
                  ),

                  const SizedBox(height: 20),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projetos[projetoAtual]["categoria"],
                        style: const TextStyle(color: azulEscuro),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        projetos[projetoAtual]["nome"],
                        style: tituloTextosProjetos,
                      ),

                      const SizedBox(height: 10),

                      Text(projetos[projetoAtual]["descricao"]),

                      const SizedBox(height: 15),

                      Container(width: 45, height: 1, decoration: linhaTitulo),

                      const SizedBox(height: 15),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: curtirProjeto,
                                icon: Icon(
                                  curtiu
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                ),
                              ),

                              Text("$curtidas"),
                            ],
                          ),

                          TextButton(
                            onPressed: proximoProjeto,
                            child: const Row(
                              children: [
                                Text("Próximo projeto"),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward),
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
          ],
        ),
      ),
    );
  }
}
