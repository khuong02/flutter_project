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
  bool isOnTap = false;

  QuizMaker quizMaker = QuizMaker();
  int questionNumber = 0;

  bool isAbsorbing = false;

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
        OptionWidget(
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
                },
              );
              _controller.restart();
              isOnTap = false;
            } else {
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
          },
        ),
      );
    }
    return Options;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.only(top: 40, right: 15, left: 15, bottom: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: cardDetailList[widget.categoryIndex].gradients,
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomCloseButton(),
                  CircularCountDownTimer(
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
                          questionNumber++;
                        });
                        _controller.restart();
                      } else {
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
                    },
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                      ),
                    ),
                    child: const Icon(
                      Icons.favorite_sharp,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height * 0.15,
                width: size.width * 0.65,
                child: Image.asset(
                  cardDetailList[widget.categoryIndex].iconAssetName,
                  fit: BoxFit.fitHeight,
                ),
              ),
              Container(
                child: SizedBox(
                  height: size.height * 0.25,
                  child: GridView.count(
                    crossAxisCount: 1,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
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
                              width: size.width,
                              child: AutoSizeText(
                                quizMaker.getQuestion(questionNumber),
                                minFontSize: 18,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
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
              ),
              ...buildOptions(questionNumber),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_sharp,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite_sharp,
                        color: Colors.white,
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
}
