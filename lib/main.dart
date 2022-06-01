import 'package:flutter/material.dart';
import 'package:quiz_quest/quiz_mainframe.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quiz_Main newQuiz = Quiz_Main();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> Score = []; //listofIcon

  void checkAnswer(bool playerChoice){
    bool correctAnswer = newQuiz.getAnswer();

    setState((){
      if(newQuiz.isComplete() == true){
        Alert(context: context, title: "Congrat!", desc: "You are finish all the quiz.").show();
        newQuiz.reset();
        Score = [];
      }
      if(newQuiz.getAnswer() == playerChoice){
        Score.add(Icon(Icons.check, color: Colors.green),);
      } else {
        Score.add(Icon(Icons.close, color: Colors.red),);
      }
      newQuiz.nextQuest();
    });
  }

  // List<String> questions = [
  //   'The atomic number for lithium is 17',
  //   'A cross between a horse and a zebra is called a \'Hobra\'',
  //   'The black box in a plane is black',
  // ];
  // List<bool> answer = [false,false,false];

  //Question q1 = Question('The atomic number for lithium is 17', false);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                newQuiz.getQuestion(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              ),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: Score,
        )
      ],
    );
  }
}
