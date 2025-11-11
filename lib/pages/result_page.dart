import 'package:flutter/material.dart';
import 'package:quizpop/pages/home_page.dart';

class ResultPage extends StatelessWidget {
  final int finalScore;
  const ResultPage({super.key, required this.finalScore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resultado Final',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Container(
        width: double.infinity,
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
              Image(image: AssetImage('images/confete.png'), height: 200),
              SizedBox(height: 40),
              Text(
                'Parabéns! Você completou o quiz. \nSua pontuação final é $finalScore.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                ),
                child: Text('Retornar ao início'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
