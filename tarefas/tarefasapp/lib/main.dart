import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tarefasapp/firebase_options.dart';
import 'package:tarefasapp/navigation/navbar.dart';
import 'package:tarefasapp/screens/cadastro.dart';
import 'package:tarefasapp/screens/login.dart';
import 'package:tarefasapp/screens/splash.dart';
import 'package:tarefasapp/screens/tarefas.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); //fala para os componentes esperar o firebase inicializar antes de executar o app
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform, //na platafroma atual o firebase adpata para prover dados de configuração corretos
  ); //inicializa o firebase

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/":(context) => SplashScreen(),
        "/login":(context) => Login(),
        "/cadastro":(context) => Cadastro(),
        "/tarefas":(context) => Tarefas(),
        "/navbar":(context)=> NavBar()
      },
    );
  }
}