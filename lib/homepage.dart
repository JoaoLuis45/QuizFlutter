import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'infinium'
        ),
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
                  Image.asset('assets/images/pokemon.png',height: 150,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushNamed(context, '/perguntasRespostas'),
                      child: Text(
                        'Jogar',
                        style: TextStyle(fontSize: 30),
                      ),
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.fromLTRB(100, 20, 100, 20)),),
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
