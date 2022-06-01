import 'question.dart';

int _QuestionNumber = 0;

class Quiz_Main{
  List<Question> _questionBank = [
    Question('The atomic number for lithium is 17', false),
    Question('A cross between a horse and a zebra is called a \'Hobra\'', false),
    Question('The black box in a plane is black', false),
    Question('Alliumphobia is a fear of garlic', true),
    Question('Prince Harry is taller than Prince William', true),
    Question('The star sign Aquarius is represented by a tiger', false),
    Question('Meryl Streep has won two Academy Awards', true),
    Question('Marrakesh is the capital of Morocco', false),
    Question('The unicorn is the national animal of Scotland', false),
    //Question('There are two parts of the body that can\'t heal themselves', true),
    //Question('The Battle Of Hastings took place in 1066', false),
    //Question('K is worth four points in Scrabble', false),
    //Question('TAriana Grande is 25 or under', true)
  ];

  void nextQuest(){
    if (_QuestionNumber < _questionBank.length - 1){
      _QuestionNumber++;
    }
  }

  String getQuestion (){
    return _questionBank[_QuestionNumber].questionText;
  }
  bool getAnswer(){
    return _questionBank[_QuestionNumber].questionAnswer;
  }
  bool isComplete(){
    if(_QuestionNumber >= _questionBank.length - 1){
      return true;
    } else {
      return false;
    }
  }
  void reset(){
    _QuestionNumber = 0;
  }
}