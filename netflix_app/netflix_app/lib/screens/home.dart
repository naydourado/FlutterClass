import 'package:flutter/material.dart';
import 'package:netflix_app/components/botaonavegar.dart';
import 'package:netflix_app/components/minhaappbar.dart';
import 'package:netflix_app/screens/detalhes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({super.key});

  @override
  State<TelaHome> createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  //lógica do estado da tela
  List<String> mostrarFilmes = [];

  @override
  void initState() {
    //funcao que carrega uma outra funcao quando a tela abre
    super.initState();
    carregarFilmes();
  }

  //toda vez que uma função busca um dado de outra plataforma use uma função ASYNC, pois ela demora para carregar e não pode travar a tela
  void carregarFilmes() async {
    SharedPreferences banco =
        await SharedPreferences.getInstance(); //cria uma instancia do banco de dados
    List<String> filmesBanco =
        banco.getStringList("filmes") ??
        []; //pega a lista de filmes do banco, se não tiver nada, cria uma lista vazia
    setState(() {
      //alterar valor de uma variável
      mostrarFilmes = filmesBanco;
    });
  }

  void deletarFilmes(String filme) async {
    SharedPreferences banco = await SharedPreferences.getInstance();
    List<String> filmesBanco = banco.getStringList("filmes") ?? [];
    filmesBanco.remove(filme);
    await banco.setStringList("filmes", filmesBanco);
    setState(() {
      mostrarFilmes = filmesBanco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MinhaAppBar(),

      body: mostrarFilmes.isEmpty
          ? Center(child: Text("Nenhum filme cadastrado"))
          : GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),

              children: [
                for (String filme in mostrarFilmes)
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TelaDetalhes(filme: filme),
                          ),
                        ),

                        child: Image.network(
                          filme.split("|")[3],
                          width: 100,
                          height: 100,
                        ),
                      ),

                      Text(filme.split("|")[0]),
                      BotaoNavegar(
                        funcao: () => deletarFilmes(filme),
                        textoBotao: "Deletar",
                      ),
                    // ListView.builder(itemBuilder: (context, index) {
                    // dynamic filme = mostrarFilmes[index];
                    // return Column(children: [
                    //   GestureDetector(onTap: ()=>Navigator.push(context,MaterialPageRoute(builder:(context) => TelaDetalhes(filme: filme))),
                    //   child:Image.network(filme.split("|")[3], width: 100,),
                    //   ),
                    //   Text(filme.split("|")[0]),
                    //   BotaoNavegar(funcao: ()=> deletarFilmes(filme),textobotao: "Deletar",)
                    // ],);
                    // }, itemCount: mostrarFilmes.length,)
                    ],
                  ),
              ],
            ),
    );
  }
}
