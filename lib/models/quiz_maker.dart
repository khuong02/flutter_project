import 'package:do_an_di_dong/Consts/cosntants.dart';

import 'questions.dart';

class QuizMaker {
  List<Question> _questionList = [];
  int _score = 0;
  int numberQuestion = 10;

  List<String> _createOptions(dynamic json, int i) {
    List<String> list = (json[i]['incorrectAnswers']).cast<String>();
    list.add(json[i]['correctAnswer']);

    list.shuffle();

    return list;
  }

  int getCorrectIndex(int i) {
    for (int j = 0; j < 4; j++) {
      if (_questionList[i].options[j] == _questionList[i].correctAnswer) {
        return j;
      }
    }
    return 0;
  }

  void getList(dynamic json) {
    if (Constants.isRank) {
      numberQuestion = json["total"];

      for (int i = 0; i < numberQuestion; i++) {
        _questionList.add(Question(
          question: json["questions"][i]['question'],
          correctAnswer: json["questions"][i]['correctAnswer'],
          options: _createOptions(json["questions"], i),
        ));
      }
    } else {
      for (int i = 0; i < 10; i++) {
        _questionList.add(Question(
          question: json[i]['question'],
          correctAnswer: json[i]['correctAnswer'],
          options: _createOptions(json, i),
        ));
      }
    }
    // numberQuestion = _questionList.length;
  }

  String getQuestion(int i) {
    return _questionList[i].question;
  }

  List<String> getOptions(int i) {
    return _questionList[i].options;
  }

  bool isCorrect(int i, int selectedOption) {
    if (_questionList[i].options[selectedOption] ==
        _questionList[i].correctAnswer) return true;
    return false;
  }

  void increaseScore() {
    _score += 100;
  }

  int getScore() {
    return _score;
  }
}
