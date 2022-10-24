import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/board.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/title.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/winner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatefulWidget{
  const Leaderboard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard>{
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                const TitleWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    WinnerContainer(
                      height: 120.0,
                      winnerPosition: 2,
                      winnerName: 'winner2',
                      color: Colors.green,
                    ),
                    WinnerContainer(
                      height: 150.0,
                      winnerPosition: 1,
                      winnerName: 'winner1',
                      color: Colors.red,
                    ),
                    WinnerContainer(
                      height: 100.0,
                      winnerPosition: 3,
                      winnerName: 'winner3',
                      color: Colors.blue,
                    ),
                  ],
                ),
                Board(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}