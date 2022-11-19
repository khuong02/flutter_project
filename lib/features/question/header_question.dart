import 'dart:math';

import 'package:do_an_di_dong/features/question/help_audience.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../Widgets/close_button.dart';
import '../../Utilities/card/card_details.dart';
import '../../Widgets/optionWidget.dart';
import '../../models/quiz_maker.dart';
import '../../screens/score/score_screen.dart';
import '../../Consts/cosntants.dart';

class HeaderQuestion extends StatefulWidget {
  HeaderQuestion({required this.questionData, required this.categoryIndex});

  final questionData;
  final int categoryIndex;

  @override
  State<HeaderQuestion> createState() => _HeaderQuestionState();
}

class _HeaderQuestionState extends State<HeaderQuestion> {
  @override
  void initState() {
    super.initState();
    quizMaker.getList(widget.questionData);
  }

  final CountDownController _controller = CountDownController();

  QuizMaker quizMaker = QuizMaker();

  int questionNumber = 0;
  int userHeart = 3;

  bool isOnTap = false;
  bool fiftyfifty = false;
  bool isTapFifty = false;
  bool isAbsorbing = false;
  bool isHelpAudience = false;

  // time choi moi cau hoi
  final int duration = Constants.duration;

  List<Color> optionColor = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white
  ];

  List<Widget> buildOptions(int i) {
    List<String> options = quizMaker.getOptions(i);
    List<Widget> Options = [];

    for (int j = 0; j < 4; j++) {
      Options.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: OptionWidget(
            widget: widget,
            option: options[j],
            optionColor: optionColor[j],
            onTap: () async {
              if (isOnTap) {
                return;
              }
              isOnTap = true;
              _controller.pause();
              if (quizMaker.isCorrect(i, j)) {
                setState(
                  () {
                    optionColor[j] = Colors.green;
                    isAbsorbing = true;
                  },
                );
                quizMaker.increaseScore();
              } else {
                setState(
                  () {
                    optionColor[j] = Colors.red;
                    optionColor[quizMaker.getCorrectIndex(i)] = Colors.green;
                    isAbsorbing = true;
                    userHeart--;
                  },
                );
              }
              await Future.delayed(
                const Duration(microseconds: 500000, milliseconds: 30),
                () {},
              );
              if (questionNumber < 9) {
                setState(
                  () {
                    optionColor[j] = Colors.white;
                    optionColor[quizMaker.getCorrectIndex(i)] = Colors.white;
                    questionNumber++;
                    isAbsorbing = false;
                    fiftyfifty = false;
                  },
                );
                _controller.restart();
                isOnTap = false;
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
    if (fiftyfifty) {
      int index = quizMaker.getCorrectIndex(i);
      List<Widget> replace_index = [
        Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: OptionWidget(
            widget: widget,
            option: "",
            optionColor: Colors.white,
            onTap: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 13),
          child: OptionWidget(
            widget: widget,
            option: "",
            optionColor: Colors.white,
            onTap: () {},
          ),
        ),
      ];
      if (index == 3 || index == 2) {
        Options.replaceRange(0, 2, replace_index);
      }
      if (index == 0 || index == 1) {
        Options.replaceRange(2, 4, replace_index);
      }
    }
    return Options;
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
          leading: const CustomCloseButton(),
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
                  fiftyfifty = false;
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
                            'question ${(questionNumber + 1).toString()} of 10',
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
              ...buildOptions(questionNumber),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: isTapFifty
                          ? null
                          : () {
                              setState(() {
                                fiftyfifty = true;
                                isTapFifty = true;
                              });
                            },
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          CupertinoIcons.divide_square,
                          color: isTapFifty ? Colors.grey : Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: isHelpAudience
                          ? null
                          : () {
                              setState(() {
                                isHelpAudience = true;
                              });
                              showHelpAudience(isTapFifty,
                                  quizMaker.getCorrectIndex(questionNumber));
                            },
                      child: SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.safety_divider,
                          color: isTapFifty ? Colors.grey : Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const SizedBox(
                        height: 35,
                        width: 35,
                        child: Icon(
                          Icons.people,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ),
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
        ),
      ),
    );
  }

  showHelpAudience(bool isTapFifty, int indexCorrect) {
    showDialog<dynamic>(
      context: context,
      builder: (BuildContext context) => Center(
        child: HelpAudience(
          indexCorrect: indexCorrect,
          isTapFifty: isTapFifty,
        ),
      ),
    );
  }
}
