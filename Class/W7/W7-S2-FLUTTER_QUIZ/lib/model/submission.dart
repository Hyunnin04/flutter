
import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/lib/model/quiz.dart';

class Answer {
  final String questionAnswer;
  Answer(this.questionAnswer);

  bool isCorrect(Question question) {
    return questionAnswer == question.goodAnswer; 
  }
}

class Submission {
  final Map<Question, Answer> _answers = {};

  int getScore() {
    int totalScore = 0; 

    for (var entry in _answers.entries) {
      if (entry.value.isCorrect(entry.key)) {
        totalScore++;
      }
    }

    return totalScore; 
  }

  Answer? getAnswerFor(Question question) {
    return _answers[question];
  }

void addAnswer(Question question, String answer) {
  if (_answers.containsKey(question)) {
    return;
  }
  _answers[question] = Answer(answer);
}


  void removeAnswers() {
    _answers.clear();
  }
}
