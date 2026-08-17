import 'package:flutter/material.dart';
import 'package:portfolio_nayra/pages/telaHome.dart';
import 'package:portfolio_nayra/pages/telaInsight.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;

  List telas = [
    TelaHome(),
    TelaInsight()
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
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: "Insight")
      ],
      currentIndex: index,
      onTap: mudarIndex,
      type: BottomNavigationBarType.fixed,),
    );
  }
}