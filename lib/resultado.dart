import 'package:flutter/material.dart';
import 'package:quiz/perguntas_respostas.dart';

class Resultado extends StatelessWidget {
  final acertos;
  final classificacao;
  const Resultado(
      {super.key, required this.acertos, required this.classificacao});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'infinium'),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Resultado:',
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    'Você acertou\n       $acertos de 10\n   perguntas',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    classificacao,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/perguntasRespostas');
                        PerguntasRespostas.acertos = 0;
                        PerguntasRespostas.perguntasAnteriores = [];
                      },
                      child: Text(
                        'Reiniciar',
                        style: TextStyle(fontSize: 25),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
