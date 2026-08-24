import 'package:flutter/material.dart';
import 'package:portfolio_nayra/style/geral.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class TelaHome extends StatelessWidget {
  const TelaHome({super.key});

  Future<void> abrirLink(String link) async {
    final Uri url = Uri.parse(link);

    if (await canLaunchUrl(url)) {
      await launchUrl(url, webOnlyWindowName: '_blank');
    } else {
      print("Não foi possível abrir o link");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 230,
                    height: 230,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/nayra.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  const SizedBox(width: 30),

                  Expanded(
                    child: Column(
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
                          "Eu sou Nayra Dourado Oliveira.",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),

                        const Text("Seja bem-vindo(a) ao meu Portfolio!"),

                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                abrirLink(
                                  "https://www.linkedin.com/in/nayra-dourado-oliveira-7827a121a/",
                                );
                              },

                              style: TextButton.styleFrom(
                                backgroundColor: azulClaroBotao,
                                foregroundColor: azulEscuro,
                              ),

                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(FontAwesomeIcons.linkedin, size: 25),

                                  SizedBox(width: 8),

                                  Text("LinkedIn"),
                                ],
                              ),
                            ),

                            const SizedBox(width: 10),

                            TextButton(
                              onPressed: () {
                                abrirLink("https://github.com/naydourado");
                              },

                              style: TextButton.styleFrom(
                                backgroundColor: azulClaroBotao,
                                foregroundColor: azulEscuro,
                              ),

                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  FaIcon(FontAwesomeIcons.github, size: 25),

                                  SizedBox(width: 8),

                                  Text("GitHub"),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              Column(
                children: [
                  Text("Sobre mim", style: tituloTextos),

                  const SizedBox(height: 5),

                  Container(width: 45, height: 1, decoration: linhaTitulo),

                  const SizedBox(height: 10),

                  const Text(
                    "Estudo a área de tecnologia desde o ensino médio e, durante minha formação, "
                    "tive contato com desenvolvimento de software, Front-End, UI/UX e diferentes "
                    "ferramentas e processos da área.\n"
                    "Atualmente, tenho direcionado meus estudos para a área de Qualidade de Software "
                    "(QA), principalmente em testes, validação de funcionalidades e análise de processos, "
                    "acompanhando também minha atuação profissional.",
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),

              const SizedBox(height: 25),

              Column(
                children: [
                  Text("Tecnologias", style: tituloTextos),

                  const SizedBox(height: 5),

                  Container(width: 45, height: 1, decoration: linhaTitulo),

                  const SizedBox(height: 20),

                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 5,
                    runSpacing: 5,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: container,
                        child: const Text("JavaScript"),
                      ),

                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: container,
                        child: const Text("Flutter"),
                      ),

                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: container,
                        child: const Text("Figma"),
                      ),

                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: container,
                        child: const Text("React"),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 35),

              Column(
                children: [
                  Text("Curiosidades", style: tituloTextos),

                  const SizedBox(height: 5),

                  Container(width: 45, height: 1, decoration: linhaTitulo),

                  const SizedBox(height: 20),

                  Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: [
                      Container(
                        width: 230,
                        height: 180,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: azulClaroBotao,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.music_note),
                                SizedBox(width: 3),
                                Text(
                                  "Música",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Text(
                              "A música está sempre presente no meu dia a dia. "
                              "Gosto de diferentes estilos e também toco um pouco de violão.",
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 230,
                        height: 180,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: azulClaroBotao,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.menu_book),
                                SizedBox(width: 3),
                                Text(
                                  "Leitura",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Gosto de aproveitar meus momentos livres para ler e conhecer histórias e perspectivas diferentes.",
                            ),
                          ],
                        ),
                      ),

                      Container(
                        width: 230,
                        height: 180,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: azulClaroBotao,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.cake),
                                SizedBox(width: 3),
                                Text(
                                  "Cozinhar",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Text(
                              "Nunca fui muito de cozinhar, mas ultimamente tenho gostado de testar receitas doces.",
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
      ),
    );
  }
}
