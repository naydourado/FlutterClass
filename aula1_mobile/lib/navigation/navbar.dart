import 'package:aula1_mobile/pages/telaColumn.dart';
// import 'package:aula1_mobile/pages/telamix.dart';
import 'package:aula1_mobile/pages/telamixvini.dart';
import 'package:aula1_mobile/pages/telarow.dart';
import 'package:aula1_mobile/pages/telastack.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  // aqui fica a lógica
  int index = 0;

  List telas = [
    TelaColumn(),
    TelaRow(),
    TelaStack(),
    TelaMixVini()
  ];

  void mudarIndex(int indexNovo){
    setState(() {
      index = indexNovo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas.elementAt(index),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.view_agenda), label: "Colum"),
        BottomNavigationBarItem(icon: Icon(Icons.view_column), label: "Row"),
        BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Stack"),
        BottomNavigationBarItem(icon: Icon(Icons.widgets), label: "Mix"),
      ],
      currentIndex: index, //fala qual é o index atual para abrir a página
      onTap: mudarIndex, //função para mudar o index
      type: BottomNavigationBarType.fixed, //tira o aviso de limite de botões
      ),
    );
  }
}