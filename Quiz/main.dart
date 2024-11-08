import 'dart:io';

class Question {
  String text;
  List<String> options;
  List<int> correctAnswers;
  bool isMultipleChoice;

  // Constructor with an additional parameter for multiple-choice questions
  Question(this.text, this.options, this.correctAnswers, this.isMultipleChoice);

  // Check if the user answer is correct, based on single or multiple choice
  bool isCorrect(List<int> userAnswers) {
    if (isMultipleChoice) {
      // Sort and compare userAnswers with correctAnswers
      userAnswers.sort();
      return userAnswers.toString() == correctAnswers.toString();
    } else {
      // Single answer - only one correct answer should be in userAnswers
      return userAnswers.length == 1 && userAnswers[0] == correctAnswers[0];
    }
  }
}

class Participant {
  String firstName;
  String lastName;
  int score = 0;

  Participant(this.firstName, this.lastName);

  String get fullName => '$firstName $lastName';

  void increaseScore() {
    score++;
  }
}

class Quiz {
  List<Question> questions;
  Participant participant;

  Quiz(this.questions, this.participant);

  void start() {
    print('Hello ${participant.fullName}, let\'s start the quiz!\n');

    for (var question in questions) {
      print(question.text);

      for (var option in question.options) {
        print(option);
      }

      stdout.write(
          'Your answer${question.isMultipleChoice ? "s (There are multiple answer(require commas))" : ""}: ');
      var userInput = stdin.readLineSync();

      // Parse user input into a list of integers
      List<int> userAnswers = userInput != null
          ? userInput.split(',').map((e) => int.parse(e.trim())).toList()
          : [];

      if (question.isCorrect(userAnswers)) {
        print('Correct!\n');
        participant.increaseScore();
      } else {
        print('Wrong Answer!\n');
      }
    }

    print(
        'Quiz over! ${participant.fullName}, you scored ${participant.score} out of ${questions.length}\n');
    showCorrectAnswers();
    saveUserHistory();
  }

  void showCorrectAnswers() {
    print('Here are the correct answers for each question:\n');
    for (var i = 0; i < questions.length; i++) {
      print('${i + 1}. ${questions[i].text}');
      print(
          'Correct Answer${questions[i].isMultipleChoice ? "s" : ""}: ${questions[i].correctAnswers.join(', ')}\n');
    }
  }
  void saveUserHistory() {
    String fileName = '${Directory.current.path}/QuizHistory.txt';
    String historyEntry = '${participant.fullName} - '
        'Score: ${participant.score}/${questions.length} - '
        'Date: ${DateTime.now()}\n';

    // Append the history entry to the file
    File file = File(fileName);
    file.writeAsStringSync(historyEntry, mode: FileMode.append);

    print('Quiz history saved to $fileName.');
  }
}

void main() {
  List<Question> questions = [
    Question(
      'What is Dart primarily used for?',
      [
        '1. Web development',
        '2. Data Science',
        '3. Game development',
        '4. Mobile app development'
      ],
      [4],
      false, // This question has multiple correct answers
    ),
    Question(
      'Which framework is commonly associated with Dart for building mobile applications?',
      ['1. React Native', '2. Flutter', '3. Xamarin', '4. Ionic'],
      [2],
      false, // This question has a single correct answer
    ),
    Question(
      'What is the file extension for Dart source files?',
      ['1. .dart', '2. .dts', '3. .dartfile', '4. .d'],
      [1],
      false,
    ),
    Question(
      'Which keyword is used to define a constant value in Dart?',
      ['1. final', '2. const', '3. static', '4. var'],
      [2],
      false,
    ),
    Question(
      'How do you print text to the console in Dart?',
      [
        '1. echo("Hello");',
        '2. print("Hello");',
        '3. write("Hello");',
        '4. display("Hello");'
      ],
      [2],
      false,
    ),
    Question(
      ' Which of the following data types are available in Dart?',
      ['1. int', '2. double', '3. string', '4. character'],
      [1, 2, 3],
      true,
    ),
    Question(
      ' Which of the following are types of Flutter widgets?',
      [
        '1. StatelessWidget',
        '2. DynamicWidget',
        '3. StatefulWidget',
        '4. AnimatedWidget'
      ],
      [1, 3],
      true,
    ),
    Question(
      ' Which two of the following can be used to display images in Flutter?',
      ['1. Image.asset', '2. Image.network', '3. Image.file', '4. Image.text'],
      [1, 2],
      true,
    ),
    Question(
      ' Which two of the following are commonly used for layout in Flutter?',
      ['1. Row', '2. Column', '3. ListItem', '4. Stack'],
      [1, 2],
      true,
    ),
    Question(
      ' Which two of the following properties are used to customize text styles in Flutter?',
      ['1. fontSize', '2. textAlignment', '3. fontWeight', '4. textColor'],
      [1, 3],
      true,
    ),
  ];

  stdout.write('Please enter your first name: ');
  String? firstName = stdin.readLineSync();
  stdout.write('Please enter your last name: ');
  String? lastName = stdin.readLineSync();

  if (firstName != null &&  firstName.isNotEmpty && lastName != null && lastName.isNotEmpty) {
    Participant participant = Participant(firstName, lastName);
    Quiz quiz = Quiz(questions, participant);
    quiz.start();
  } else {
    print('Name cannot be empty.');
  }
}
