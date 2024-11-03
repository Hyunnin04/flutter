// import 'dart:io'; // For reading user input

// void main() {
//   // A list of quiz questions
//   List<Map<String, Object>> quiz = [
//     {
//       'question': 'What\'s the capital of France?',
//       'options': ['1. Paris', '2. London', '3. Berlin', '4. Madrid'],
//       'correctAnswer': 1, // Index of the correct answer
//     },
//     {
//       'question': 'Which planet is closest to the Sun?',
//       'options': ['1. Venus', '2. Earth', '3. Mercury', '4. Mars'],
//       'correctAnswer': 3,
//     },
//     {
//       'question': 'Who wrote "Hamlet"?',
//       'options': ['1. Charles Dickens', '2. J.K. Rowling', '3. William Shakespeare', '4. Mark Twain'],
//       'correctAnswer': 3,
//     },
//   ];

//   int score = 0; // Keep track of the score

//   for (var question in quiz) {
//     print(question['question']);
//     List<String> options = question['options'] as List<String>;
    
//     // Display options for the question
//     for (var option in options) {
//       print(option);
//     }

//     // Get user's answer
//     stdout.write('Enter the number of your answer: ');
//     String? userAnswer = stdin.readLineSync();

//     if (userAnswer != null && int.tryParse(userAnswer) == question['correctAnswer']) {
//       print('Correct!\n');
//       score++;
//     } else {
//       print('Wrong! The correct answer is option ${question['correctAnswer']}\n');
//     }
//   }

//   print('Quiz finished! Your score: $score/${quiz.length}');
// }

//////////////////////////////////////
// Base class for Question
class Question {
  String title;
  List<String> options;

  Question(this.title, this.options);

  // Method that checks the answer - to be overridden by child classes
  bool checkAnswer(dynamic answer) {
    return false; // Placeholder logic
  }
}

// SingleChoice class inherits from Question
class SingleChoice extends Question {
  int correctAnswer;

  // Call the parent constructor using `super`
  SingleChoice(String title, List<String> options, this.correctAnswer)
      : super(title, options);

  // Override the checkAnswer method for SingleChoice
  @override
  bool checkAnswer(int answer) {
    return answer == correctAnswer;
  }
}

// MultipleChoice class inherits from Question
class MultipleChoice extends Question {
  List<int> correctAnswer;

  MultipleChoice(String title, List<String> options, this.correctAnswer)
      : super(title, options);

  // Override the checkAnswer method for MultipleChoice
  @override
  bool checkAnswer(List<int> answer) {
    return answer.length == correctAnswer.length &&
        answer.every((element) => correctAnswer.contains(element));
  }
}

// Participant class
class Participant {
  String firstName;
  String lastName;

  Participant(this.firstName, this.lastName);
}

// Quiz class containing list of questions and participants
class Quiz {
  List<Question> questions = [];
  List<Participant> participants = [];

  void addQuestion(Question question) {
    questions.add(question);
  }

  void addParticipant(Participant participant) {
    participants.add(participant);
  }

  void calculateResults() {
    print("Results calculation...");
    // Logic to calculate results
  }
}

// Result class stores participant and their score
class Result {
  Participant participant;
  int score;

  Result(this.participant, this.score);

  int calculateScore() {
    return score; // Placeholder logic
  }
}

void main() {
  // Create a new SingleChoice question
  var question1 = SingleChoice("What is 2 + 2?", ["1", "2", "3", "4"], 3);
  
  // Checking an answer
  print(question1.checkAnswer(3)); // true for correct answer

  // Create a new MultipleChoice question
  var question2 = MultipleChoice("Select even numbers", ["1", "2", "3", "4"], [1, 3]);
  
  // Checking an answer
  print(question2.checkAnswer([1, 3])); // true for correct answers

  // Create a quiz and add questions
  var quiz = Quiz();
  quiz.addQuestion(question1);
  quiz.addQuestion(question2);

  // Create a participant
  var participant = Participant("John", "Doe");
  quiz.addParticipant(participant);

  // Calculate results (currently placeholder)
  quiz.calculateResults();
}
