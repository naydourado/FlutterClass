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
              // TOPO
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 230,
                    height: 230,

                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                      // border: Border.all(width: 4.0), // color: Colors.blue,
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
                      Text(
                        "Olá,",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),

                      Text(
                        "Eu sou Nayra Dourado Oliveira.",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),

                      Text("Seja bem-vindo(a) ao meu Portfolio!"),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              abrirLink(
                                "https://www.linkedin.com/in/nayra-dourado-oliveira-7827a121a/",
                              );
                            },
                            icon: FaIcon(FontAwesomeIcons.linkedin, size: 30),
                          ),

                          SizedBox(width: 10),

                          IconButton(
                            onPressed: () {
                              abrirLink("https://github.com/naydourado");
                            },
                            icon: FaIcon(FontAwesomeIcons.github, size: 30),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 35),

              // SOBRE MIM
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

              // TECNOLOGIAS
              Column(
                children: [
                  Text("Tecnologias", style: tituloTextos),

                  const SizedBox(height: 5),

                  Container(width: 45, height: 1, decoration: linhaTitulo),

                  const SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 5,

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

              // CURIOSIDADES
              Column(
                children: [
                  const Text("Curiosidades"),

                  const SizedBox(height: 5),

                  Container(width: 45, height: 1, decoration: linhaTitulo),

                  const SizedBox(height: 20),

                  Row(
                    spacing: 20,
                    children: [
                      Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: const Color(0xffe4fcf0),
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.music_note),

                                Text(
                                  "Música",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Text(
                              "A música faz parte do meu dia a dia.\n"
                              "Inclusive, toco o básico do violão.",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Container(
                        width: 200,
                        height: 150,
                        padding: const EdgeInsets.all(12),

                        decoration: BoxDecoration(
                          color: const Color(0xffe4fcf0),
                          borderRadius: BorderRadius.circular(15),
                        ),

                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.music_note),

                                Text(
                                  "Música",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),

                            SizedBox(height: 5),

                            Text(
                              "A música faz parte do meu dia a dia.\n"
                              "Inclusive, toco o básico do violão.",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
