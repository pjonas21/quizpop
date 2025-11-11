import 'package:flutter/material.dart';
import 'package:quizpop/pages/home_page.dart';
import 'package:quizpop/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'QuizPop',
      theme: tema,
      home: MyHomePage(),
    );
  }
}
