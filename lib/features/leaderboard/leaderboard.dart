import 'package:do_an_di_dong/Consts/cosntants.dart';
import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/board.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/title.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/winner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/leaderboard_obj.dart';

class Leaderboard extends StatefulWidget{
  final List<LeaderBoardObj> users;

  const Leaderboard({Key? key, required this.users}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard>{
  late List<LeaderBoardObj> leaderboard = [];

  void validateUserLeaderBoard(){
    leaderboard = widget.users;
    if (widget.users.length < 0) {
      leaderboard.add(LeaderBoardObj(null, null, null, null, 'winner1', 'winner1@gmail.com', Constants.imageUri));
      leaderboard.add(LeaderBoardObj(null, null, null, null, 'winner2', 'winner2@gmail.com', Constants.imageUri));
      leaderboard.add(LeaderBoardObj(null, null, null, null, 'winner3', 'winner3@gmail.com', Constants.imageUri));
    }

    if (widget.users.length < 1) {
      leaderboard.add(LeaderBoardObj(null, null, null, null, 'winner2', 'winner2@gmail.com', Constants.imageUri));
      leaderboard.add(LeaderBoardObj(null, null, null, null, 'winner3', 'winner3@gmail.com', Constants.imageUri));
    }

    if (widget.users.length < 2) {
      leaderboard.add(LeaderBoardObj(null, null, null, null, 'winner3', 'winner3@gmail.com', Constants.imageUri));
    }
  }

  @override
  Widget build(BuildContext context) {
    validateUserLeaderBoard();
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
                  children: [
                    WinnerContainer(
                      height: 120.0,
                      winnerPosition: 2,
                      user: leaderboard[1],
                      color: Colors.green,
                      positionName: 3,
                    ),
                    WinnerContainer(
                      height: 150.0,
                      winnerPosition: 1,
                      user: leaderboard[0],
                      color: Colors.red,
                      positionName: 0,
                    ),
                    WinnerContainer(
                      height: 100.0,
                      winnerPosition: 3,
                      user: leaderboard[2],
                      color: Colors.blue,
                      positionName: 25,
                    ),
                  ],
                ),
                Board(list:leaderboard),
              ],
            ),
          ),
        ),
      ),
    );
  }
}