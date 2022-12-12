import 'dart:math';

import 'package:do_an_di_dong/Utilities/my_error/error_dialog.dart';
import 'package:do_an_di_dong/features/question/help_audience.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Widgets/close_button.dart';
import '../../Utilities/card/card_details.dart';
import '../../Widgets/optionWidget.dart';
import '../../models/quiz_maker.dart';
import '../../screens/score/score_screen.dart';
import '../../Consts/cosntants.dart';

class HeaderQuestion extends StatefulWidget {
  const HeaderQuestion({
    Key? key,
    required this.questionData,
    required this.categoryIndex,
  }) : super(key: key);
  final questionData;
  final int categoryIndex;

  @override
  State<HeaderQuestion> createState() => _HeaderQuestionState();
}

class _HeaderQuestionState extends State<HeaderQuestion> {
  DateTime timeStart = DateTime.now();

  @override
  void initState() {
    super.initState();
    getCost();
    quizMaker.getList(widget.questionData);
    numberQuestion = quizMaker.numberQuestion;
    getQuestionAndAnswer();
  }

  void getCost() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cash = prefs.getInt('cost')!;
  }

  int numberQuestion = 0;
  int numberAnswer = 0;
  int bestStreak = 0;
  int cash = 0;

  int buyCash = 1000;

  final CountDownController _controller = CountDownController();

  QuizMaker quizMaker = QuizMaker();

  int questionNumber = 0;
  int userHeart = 3;

  Map<String, bool> feature = {
    'isOnTap': false,
    'fiftyfifty': false,
    'isTapFifty': false,
    'isAbsorbing': false,
    'isHelpAudience': false,
    'isBuyAnswer': false,
    'checkTrue': false,
  };

  bool checkTrue = false;
  int correctNum = 0;

  List<String> options = [];

  getQuestionAndAnswer() {
    setState(() {
      options = quizMaker.getOptions(questionNumber);
    });
  }

  // time choi moi cau hoi
  final int duration = Constants.duration;

  List<Color> optionColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<Widget> buildOptions() {
    List<Widget> Options = [];

    for (int j = 0; j < options.length; j++) {
      Options.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: OptionWidget(
            widget: widget,
            option: options[j],
            optionColor: optionColor[j],
            onTap: () async {
              if (feature['isOnTap'] == true) {
                return;
              }
              feature['isOnTap'] = true;
              _controller.pause();
              if (quizMaker.isCorrect(questionNumber, j)) {
                setState(
                  () {
                    numberAnswer++;
                    optionColor[j] = Colors.green;
                    feature['isAbsorbing'] = true;
                    correctNum++;
                    checkTrue = true;
                    if (correctNum > bestStreak) {
                      bestStreak = correctNum;
                    }
                  },
                );

                quizMaker.increaseScore();
                if (correctNum > 4 && checkTrue) {
                  quizMaker.increaseScore();
                }
              } else {
                setState(
                  () {
                    optionColor[j] = Colors.red;
                    optionColor[quizMaker.getCorrectIndex(questionNumber)] =
                        Colors.green;
                    feature['isAbsorbing'] = true;
                    userHeart--;
                    feature['checkTrue'] = false;
                    correctNum = 0;
                  },
                );
              }
              await Future.delayed(
                const Duration(microseconds: 500000, milliseconds: 30),
                () {},
              );
              if (questionNumber < numberQuestion - 1) {
                setState(
                  () {
                    optionColor[j] = Colors.white;
                    optionColor[quizMaker.getCorrectIndex(questionNumber)] =
                        Colors.white;
                    questionNumber++;
                    getQuestionAndAnswer();
                    feature['isAbsorbing'] = false;
                    feature['fiftyfifty'] = false;
                  },
                );
                _controller.restart();
                feature['isOnTap'] = false;
                if (userHeart == 0) {
                  totalScore();
                }
              } else {
                totalScore();
              }
            },
          ),
        ),
      );
    }
    if (feature['fiftyfifty'] == true) {
      buildOptionsFifty(Options);
    }
    return Options;
  }

  void buildOptionsFifty(List<Widget> Options) {
    int index = quizMaker.getCorrectIndex(questionNumber);
    List<Widget> replace_index = [
      Padding(
        padding: const EdgeInsets.only(bottom: 13),
        child: OptionWidget(
            widget: widget,
            option: "",
            optionColor: Colors.white,
            onTap: () {}),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 13),
        child: OptionWidget(
            widget: widget,
            option: "",
            optionColor: Colors.white,
            onTap: () {}),
      ),
    ];
    if (index == 3 || index == 2) {
      Options.replaceRange(0, 2, replace_index);
    }
    if (index == 0 || index == 1) {
      Options.replaceRange(2, 4, replace_index);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 10, right: 15, left: 15, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: cardDetailList[widget.categoryIndex].gradients,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white.withOpacity(0),
          shadowColor: Colors.white.withOpacity(0),
          leading: const CustomCloseButton(color: Colors.white),
          title: CircularCountDownTimer(
            width: 50,
            height: 50,
            duration: duration,
            fillColor: Colors.grey.withOpacity(0.8),
            ringColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            autoStart: true,
            isReverse: true,
            controller: _controller,
            onComplete: () {
              if (questionNumber < 9) {
                setState(() {
                  feature['fiftyfifty'] = false;
                  userHeart--;
                  questionNumber++;
                });
                if (userHeart == 0) {
                  totalScore();
                }
                _controller.restart();
              } else {
                totalScore();
              }
            },
          ),
          actions: buildHeart(userHeart),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: size.height * 0.15,
                width: size.width * 0.65,
                child: Image.asset(
                  cardDetailList[widget.categoryIndex].iconAssetName,
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: size.height * 0.25,
                child: GridView.count(
                  crossAxisCount: 1,
                  children: [
                    SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      // height: size.height * 0.35,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'question ${(questionNumber + 1).toString()}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.15,
                            width: size.width,
                            child: AutoSizeText(
                              quizMaker.getQuestion(questionNumber),
                              minFontSize: 18,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ...buildOptions(),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: feature['isTapFifty'] == true
                          ? null
                          : () {
                              setState(() {
                                feature['fiftyfifty'] = true;
                                feature['isTapFifty'] = true;
                              });
                            },
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          CupertinoIcons.divide_square,
                          color: feature['isTapFifty'] == true
                              ? Colors.grey
                              : Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: feature['isHelpAudience'] == true
                          ? null
                          : () {
                              setState(() {
                                feature['isHelpAudience'] = true;
                              });
                              showHelpAudience(feature['fiftyfifty']!,
                                  quizMaker.getCorrectIndex(questionNumber));
                            },
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.safety_divider,
                          color: feature['isHelpAudience'] == true
                              ? Colors.grey
                              : Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    buyAnswers(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildHeart(int numheart) {
    List<Widget> heart = [];
    for (int i = 0; i < numheart; i++) {
      heart.add(
        const SizedBox(
          height: 35,
          width: 35,
          child: Icon(
            Icons.favorite_sharp,
            color: Colors.white,
          ),
        ),
      );
    }
    return heart;
  }

  void totalScore() {
    Navigator.pop(context);
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreScreen(
          score: quizMaker.getScore(),
          index: widget.categoryIndex,
          timeStart: timeStart,
          numberOfCorrectAnswer: numberAnswer,
          bestStreak: bestStreak,
          cash: cash,
        ),
      ),
    );
  }

  showHelpAudience(bool fiftyfifty, int indexCorrect) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => Center(
        child: HelpAudience(
          indexCorrect: indexCorrect,
          isTapFifty: fiftyfifty,
        ),
      ),
    );
  }

  Widget buyAnswers() {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) => CupertinoAlertDialog(
                  title: const Text('Do you want to buy the answer?'),
                  content: Text(buyCash.toString()),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        if (cash > buyCash) {
                          cash -= buyCash;
                          buyCash += buyCash;

                          showBuyAnwser(
                              quizMaker.getCorrectIndex(questionNumber));
                        } else {
                          ErrorDialog.show(
                              context, "You don't have enough money!");
                        }
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ));
      },
      child: const SizedBox(
        height: 35,
        width: 35,
        child: Icon(
          Icons.monetization_on_outlined,
          color: Colors.white,
          size: 35,
        ),
      ),
    );
  }

  showBuyAnwser(int indexCorrect) {
    setState(() {
      optionColor[indexCorrect] = Colors.yellow;
    });
  }
}
