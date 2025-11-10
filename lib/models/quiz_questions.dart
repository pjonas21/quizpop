import 'package:quizpop/models/question.dart';

List<Question> getQuestions() {
  return [
    Question(
      text: 'Qual é o elemento químico com o símbolo "O"?',
      options: ['Ouro', 'Oxigênio', 'Prata', 'Hidrogênio'],
      correctOption: 1,
    ),
    Question(
      text: 'Em que ano o homem pisou na Lua pela primeira vez?',
      options: ['1965', '1969', '1972', '1959'],
      correctOption: 1,
    ),
    Question(
      text: 'Qual é o maior planeta do nosso sistema solar?',
      options: ['Terra', 'Saturno', 'Júpiter', 'Marte'],
      correctOption: 2,
    ),
  ];
}
