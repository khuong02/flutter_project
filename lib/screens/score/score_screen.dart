import 'dart:convert';

import 'package:do_an_di_dong/api/leaderboard_api/leaderboard_api.dart';
import 'package:flutter/material.dart';
import '../../Utilities/card/card_details.dart';

class ScoreScreen extends StatefulWidget {
  final int score;
  final int index;
  final DateTime timeStart;
  final int numberOfCorrectAnswer;
  final int bestStreak;
  const ScoreScreen({
    Key? key,
    required this.score,
    required this.index,
    required this.timeStart,
    required this.numberOfCorrectAnswer,
    required this.bestStreak,
  }) : super(key: key);

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  updateLeaderBoard() async {
    Map<String, String> data = {
      'time': timePlay().toString(),
      'quantity': widget.numberOfCorrectAnswer.toString(),
      'score': widget.score.toString(),
    };

    await LeaderBoardApi().playLeaderBoard(data);
  }

  @override
  void initState() {
    updateLeaderBoard();
    super.initState();
  }

  DateTime timeEnd = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: cardDetailList[widget.index].gradients,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Congratulation!",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                              color: Colors.yellow,
                              offset: Offset(2, 3),
                            ),
                            Shadow(
                              color: Colors.yellow,
                              offset: Offset(-2, 6),
                            ),
                          ]),
                    ),
                    buildScore(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        buildDetail(
                            context,
                            "Correct",
                            widget.numberOfCorrectAnswer.toString(),
                            Colors.greenAccent),
                        buildDetail(context, "Time",
                            timePlay().toString() + "s", Colors.blue),
                        buildDetail(context, "Streak",
                            widget.bestStreak.toString(), Colors.deepOrange),
                      ],
                    ),
                    buildShared(context),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  width: 0.3 * MediaQuery.of(context).size.width,
                  height: 0.08 * MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(1, 3),
                        blurRadius: 0.7,
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.exit_to_app,
                    color: cardDetailList[widget.index].textColor,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int timePlay() {
    var timeBegin = widget.timeStart.millisecondsSinceEpoch;
    var time2 = timeEnd.millisecondsSinceEpoch;

    return (time2 - timeBegin) ~/ 1000;
  }

  Widget buildDetail(
      BuildContext context, String title, String value, Color color) {
    return Container(
      width: MediaQuery.of(context).size.height * 0.15,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black87, width: 2),
        boxShadow: [
          BoxShadow(offset: Offset(5, 6), color: color.withOpacity(0.8)),
        ],
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {},
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            Text(
              value,
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }

  Widget buildScore() {
    return Container(
      width: MediaQuery.of(context).size.height * 0.25,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              offset: Offset(2, 6), color: Colors.yellow.withOpacity(0.8)),
        ],
      ),
      child: MaterialButton(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        onPressed: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Your Score",
              style:
                  TextStyle(fontSize: 20, color: Colors.white.withOpacity(1.0)),
            ),
            Text(
              widget.score.toString(),
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

Widget buildShared(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.height * 0.45,
    height: MediaQuery.of(context).size.height * 0.08,
    decoration: BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.black87, width: 2),
      boxShadow: [
        BoxShadow(
            offset: Offset(6, 6), color: Colors.deepPurple.withOpacity(0.8)),
      ],
    ),
    child: MaterialButton(
      onPressed: () {},
      child: const ListTile(
        leading: Icon(
          Icons.share,
          color: Colors.white,
        ),
        title: Text(
          "Share with your friends!",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
