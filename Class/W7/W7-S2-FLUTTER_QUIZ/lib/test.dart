

// import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/FLUTTER_QUIZ/lib/model/quiz.dart';
// import 'package:test_flutter/W7-S2-FLUTTER_QUIZ/FLUTTER_QUIZ/lib/model/submission.dart';

// void main() {
//   Question q1 = const Question(
//       title: "Who is the best teacher?",
//       possibleAnswers: ["ronan", "hongly", 'leangsiv'],
//       goodAnswer: 'ronan');
//   Question q2 = const Question(
//       title: "Which color is the best?",
//       possibleAnswers: ["blue", "red", 'green'],
//       goodAnswer: 'red');

//   List<Question> myQuestions = [q1, q2];
//   Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);

//   Submission submission = Submission();
//   submission.addAnswer(q1, "ronan");
//   submission.addAnswer(q2, "red");

//   print("Score: ${submission.getScore()}"); // Output: Score: 2

//   Answer? answer = submission.getAnswerFor(q1);
//   if (answer != null) {
//     print(
//         "Answer for Q1: ${answer.questionAnswer}"); // Output: Answer for Q1: ronan
//   }

//   submission.removeAnswers();
//   print(
//       "Score after removing answers: ${submission.getScore()}"); // Output: Score after removing answers: 0
// }
