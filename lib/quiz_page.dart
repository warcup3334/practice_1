import 'package:flutter/material.dart';
import 'package:practice_1/information_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _questionIndex = 0;
  int _totalScore = 0;

  // Questions and choices with their respective scores
  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Which pet would you bring to Hogwarts?',
      'choices': [
        {'text': 'Owl', 'score': 3},
        {'text': 'Cat', 'score': 2},
        {'text': 'Toad', 'score': 1},
        {'text': 'Rat', 'score': 0},
      ],
    },
    {
      'questionText': 'What is your favorite magical subject?',
      'choices': [
        {'text': 'Potions', 'score': 2},
        {'text': 'Transfiguration', 'score': 3},
        {'text': 'Charms', 'score': 1},
        {'text': 'Herbology', 'score': 0},
      ],
    },
    {
      'questionText':
          'If you could visit one place in the wizarding world, where would it be?',
      'choices': [
        {'text': 'Diagon Alley', 'score': 2},
        {'text': 'Hogsmeade', 'score': 3},
        {'text': 'The Forbidden Forest', 'score': 1},
        {'text': 'The Quidditch World Cup', 'score': 0},
      ],
    },
    {
      'questionText': 'Which magical creature do you find most fascinating?',
      'choices': [
        {'text': 'Hippogriff', 'score': 3},
        {'text': 'Thestral', 'score': 2},
        {'text': 'Blast-Ended Skrewt', 'score': 1},
        {'text': 'Kneazle', 'score': 0},
      ],
    },
    {
      'questionText': 'What quality do you value most in a friend?',
      'choices': [
        {'text': 'Loyalty', 'score': 3},
        {'text': 'Intelligence', 'score': 2},
        {'text': 'Kindness', 'score': 1},
        {'text': 'Bravery', 'score': 0},
      ],
    },
  ];

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex++;
    });

    if (_questionIndex < _questions.length) {
    } else {
      _showResult();
    }
  }

  void _showResult() {
    String house;
    if (_totalScore < 2) {
      house = 'Slytherin';
    } else if (_totalScore <= 6) {
      house = 'Ravenclaw';
    } else if (_totalScore <= 10) {
      house = 'Hufflepuff';
    } else {
      house = 'Gryffindor';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Congratulations!'),
          content: Text('You belong to $house house!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InformationPage(),
                  ),
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter House Quiz'),
      ),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionText:
                  _questions[_questionIndex]['questionText'] as String,
              choices: _questions[_questionIndex]['choices']
                  as List<Map<String, Object>>,
              answerQuestion: _answerQuestion,
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class Quiz extends StatelessWidget {
  final String questionText;
  final List<Map<String, Object>> choices;
  final Function(int) answerQuestion;

  Quiz({
    required this.questionText,
    required this.choices,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          child: Text(
            questionText,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        ...choices.map((choice) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                answerQuestion(choice['score'] as int);
              },
              child: Text(choice['text'] as String),
            ),
          );
        }).toList(),
      ],
    );
  }
}
