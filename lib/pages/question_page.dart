import 'package:flutter/material.dart';
import 'package:quizpop/models/question.dart';

import 'package:quizpop/models/quiz_questions.dart';

class QuestionPage extends StatefulWidget {
  final int questionIndex;
  final int score;
  const QuestionPage({
    super.key,
    required this.questionIndex,
    required this.score,
  });

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  late List<Question> questions;
  bool answered = false;
  int? selectedOptionIndex;

  @override
  void initState() {
    super.initState();
    questions = getQuestions();
  }

  void _handleOptionSelected(int index) {
    setState(() {
      selectedOptionIndex = index;
      answered = true;
    });
  }

  void _handleNextQuestion() {
    if (widget.questionIndex < questions.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => QuestionPage(
            questionIndex: widget.questionIndex + 1,
            score: widget.score,
          ),
        ),
      );
    } else {
      // Navigate to results page
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[widget.questionIndex];
    final bool lastQuestion = widget.questionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pergunta ${widget.questionIndex + 1} / ${questions.length}',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                question.text,
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ...List.generate(question.options.length, (index) {
                final option = question.options[index];
                final isSelected = selectedOptionIndex == index;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ElevatedButton(
                    onPressed: answered
                        ? null
                        : () => _handleOptionSelected(index),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isSelected ? Colors.blueAccent : null,
                    ),
                    child: Text(option),
                  ),
                );
              }),
              SizedBox(height: 20),
              if (answered && !lastQuestion)
                ElevatedButton(
                  onPressed: _handleNextQuestion,
                  child: Text('Próxima Pergunta'),
                ),
              if (answered && widget.questionIndex == questions.length - 1)
                ElevatedButton(
                  onPressed: Navigator.of(context).pop,
                  child: Text('Retornar ao início'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
