import 'package:flutter/material.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
        centerTitle: true,
      ),
      body: QuizBody(questions: questions),
    );
  }
}

class QuizBody extends StatefulWidget {
  final List<Map<String, dynamic>> questions;

  const QuizBody({Key? key, required this.questions}) : super(key: key);

  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  int questionIndex = 0;
  int correctAnswers = 0;

  void _nextQuestion() {
    setState(() {
      if (questionIndex < widget.questions.length - 1) {
        questionIndex++;
      } else {
        // Navigate to the result screen if all questions are answered
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(correctAnswers: correctAnswers, totalQuestions: widget.questions.length),
          ),
        );
      }
    });
  }

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        correctAnswers++;
      });
    }
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QuestionWidget(
              question: widget.questions[questionIndex]['question'],
              answers: widget.questions[questionIndex]['answers'],
              onAnswer: _answerQuestion,
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<Map<String, dynamic>> answers;
  final Function(bool) onAnswer;

  const QuestionWidget({Key? key, required this.question, required this.answers, required this.onAnswer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        ...answers.map((answer) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                onAnswer(answer['isCorrect']);
              },
              child: Text(
                answer['text'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int correctAnswers;
  final int totalQuestions;

  const ResultScreen({Key? key, required this.correctAnswers, required this.totalQuestions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Natijasi"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Siz $totalQuestions savoldan $correctAnswers tasiga javob berdingiz!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Qayta o'ynaysizmi"),
            ),
          ],
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> questions = [
  {
    "question": "1. O'zbekiston bayrog'i qanday ranglar bilan belgilangan?",
    "answers": [
      {"text": "A: Oq, qizil va yashil", "isCorrect": true},
      {"text": "B: Qora, qizil va yashil", "isCorrect": false},
      {"text": "C: Oq va qora", "isCorrect": false},
    ],
  },
  {
    "question": "2. O'zbekistonda ne'mat darajadagi eng katta suv manbai qayerda joylashgan?",
    "answers": [
      {"text": "A: Charvak suv ombori", "isCorrect": true},
      {"text": "B: Sirdaryo daryosi", "isCorrect": false},
      {"text": "C: Amudaryo daryosi", "isCorrect": false},
    ],
  },
  {
    "question": "3. Toshkent shahri necha yil ichida asrlar orasida paydo bo'lgan?",
    "answers": [
      {"text": "A: Dokuz asr", "isCorrect": true},
      {"text": "B: O'n asr", "isCorrect": false},
      {"text": "C: To'qqiz asr", "isCorrect": false},
    ],
  },
  {
    "question": "4. O'zbekiston prezidenti kimdir?",
    "answers": [
      {"text": "A: Shavkat Mirziyoyev", "isCorrect": true},
      {"text": "B: Islam Karimov", "isCorrect": false},
      {"text": "C: Oybek Hasanov", "isCorrect": false},
    ],
  },
  {
    "question": "5. O'zbekiston necha davlatda bo'lib qolgan?",
    "answers": [
      {"text": "A: 15", "isCorrect": true},
      {"text": "B: 10", "isCorrect": false},
      {"text": "C: 20", "isCorrect": false},
    ],
  },
  {
    "question": "6. O'zbekistonda eng ko'p o'qiladigan dastan qaysi?",
    "answers": [
      {"text": "A: Alpomish", "isCorrect": true},
      {"text": "B: Amir Temur", "isCorrect": false},
      {"text": "C: Layli va Majnun", "isCorrect": false},
    ],
  },
  {
    "question": "7. O'zbekistonda yetiluvchan hosil qilinadigan meva-qurutgich qanday?",
    "answers": [
      {"text": "A: Olmali qurut", "isCorrect": true},
      {"text": "B: Anor", "isCorrect": false},
      {"text": "C: Olcha", "isCorrect": false},
    ],
  },
  {
    "question": "8. O'zbekistonda eng ko'p qo'llangan valyuta qaysi?",
    "answers": [
      {"text": "A: So'm", "isCorrect": true},
      {"text": "B: Dollar", "isCorrect": false},
      {"text": "C: Rubi", "isCorrect": false},
    ],
  },
  {
    "question": "9. O'zbekistonda qanday oyoqlar katta qadamlashgan?",
    "answers": [
      {"text": "A: Shaharlar", "isCorrect": false},
      {"text": "B: Dengizlar", "isCorrect": true},
      {"text": "C: O'lchovli dengizlar", "isCorrect": false},
    ],
  },
  {
    "question": "10. O'zbekiston prezidentining yillik rasmiy maoshining miqdori qancha?",
    "answers": [
      {"text": "A: Nol so'm", "isCorrect": false},
      {"text": "B: Bir milliard so'm", "isCorrect": true},
      {"text": "C: Yuz ming so'm", "isCorrect": false},
    ],
  },
];
