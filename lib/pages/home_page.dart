import 'package:flutter/material.dart';
import 'package:quizpop/pages/question_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0XFF000015), Color(0XFF002D3D)],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('images/quizapp.png'), height: 300),
              SizedBox(height: 40),
              const Text(
                'Descubra o quanto você sabe!',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (context) =>
                          QuestionPage(questionIndex: 0, score: 0),
                    ),
                  );
                },
                child: const Text('Comecar Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
