import 'package:flutter/material.dart';
import 'quiz_dados.dart';

class PerguntasRespostas extends StatefulWidget {
  const PerguntasRespostas({super.key, required this.quiz});
  static int acertos = 0;
  static String classificacao = '';
  final List quiz;
  static List<String> perguntasAnteriores = [];

  @override
  State<PerguntasRespostas> createState() => _PerguntasRespostasState();
}

class _PerguntasRespostasState extends State<PerguntasRespostas> {
  bool _hasBeenPressed = false;
  @override
  void classificar() {
    if (PerguntasRespostas.acertos <= 2) {
      PerguntasRespostas.classificacao = 'Burro';
    } else if ((PerguntasRespostas.acertos > 2) &&
        (PerguntasRespostas.acertos <= 5)) {
      PerguntasRespostas.classificacao = 'Mediano';
    } else if ((PerguntasRespostas.acertos > 5) &&
        (PerguntasRespostas.acertos <= 7)) {
      PerguntasRespostas.classificacao = 'Inteligente';
    } else if ((PerguntasRespostas.acertos > 7) &&
        (PerguntasRespostas.acertos <= 10)) {
      PerguntasRespostas.classificacao = 'Expert!';
    }
  }

  int perguntaNumero = 1;

  bool verificar(int valor) {
    if (valor == quiz[perguntaNumero - 1]['correta']) {
      setState(() {
        PerguntasRespostas.perguntasAnteriores
            .add(quiz[perguntaNumero - 1]['pergunta']);
        if (perguntaNumero < 10) {
          PerguntasRespostas.acertos += 1;
          ++perguntaNumero;
        } else {
          PerguntasRespostas.acertos += 1;
          classificar();
          Navigator.pushNamed(context, '/resultado');
        }
      });
      return true;
    } else {
      setState(() {
        PerguntasRespostas.perguntasAnteriores
            .add(quiz[perguntaNumero - 1]['pergunta']);
        if (perguntaNumero < 10) {
          ++perguntaNumero;
        } else {
          classificar();
          Navigator.pushNamed(context, '/resultado');
        }
      });
      return false;
    }
  }

  Widget build(BuildContext context) {
    quiz.shuffle();

    while ((PerguntasRespostas.perguntasAnteriores
            .contains(quiz[perguntaNumero - 1]['pergunta'])) &&
        perguntaNumero < 10) {
      quiz.shuffle();
    }

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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: Text('Pergunta $perguntaNumero de 10')),
                  Text(
                    quiz[perguntaNumero - 1]['pergunta'],
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          verificar(1);
                        },
                        child: Text(
                          quiz[perguntaNumero - 1]['respostas'][0],
                          style: TextStyle(fontSize: 20),
                        ),
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(80, 20, 80, 20)),
                            ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificar(2);
                      },
                      child: Text(
                        quiz[perguntaNumero - 1]['respostas'][1],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(80, 20, 80, 20)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificar(3);
                      },
                      child: Text(
                        quiz[perguntaNumero - 1]['respostas'][2],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(80, 20, 80, 20)),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        verificar(4);
                      },
                      child: Text(
                        quiz[perguntaNumero - 1]['respostas'][3],
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.fromLTRB(80, 20, 80, 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    ;
  }
}
