import 'package:flutter/material.dart';
import 'homepage.dart';
import 'perguntas_respostas.dart';
import 'resultado.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/perguntasRespostas': (context) => PerguntasRespostas(quiz: [],),
        '/resultado':(context) => Resultado(acertos: PerguntasRespostas.acertos,classificacao: PerguntasRespostas.classificacao,)
      },
    );
  }
}
