import 'package:do_an_di_dong/Consts/cosntants.dart';
import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Providers/theme_provider.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/board.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/title.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/winner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/leaderboard_obj.dart';

class Leaderboard extends StatefulWidget {
  final List<LeaderBoardObj> users;

  Leaderboard({Key? key, required this.users}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Leaderboard();
}

class _Leaderboard extends State<Leaderboard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Provider.of<ThemeProvider>(context).getThemeMode
            ? MyColor.leaderboardBackGroundColor
            : Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                TitleWidget(
                  color: Provider.of<ThemeProvider>(context).getThemeMode
                      ? MyColor.leaderboardBackGroundColor
                      : Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    WinnerContainer(
                      height: 120.0,
                      winnerPosition: 2,
                      user: widget.users[1],
                      color: Colors.green,
                      positionName: 3,
                      //themeColor: widget.isLightMode ? Colors.white : MyColor.leaderboardColor,
                    ),
                    WinnerContainer(
                      height: 150.0,
                      winnerPosition: 1,
                      user: widget.users[0],
                      color: Colors.red,
                      positionName: 0,
                      //themeColor: widget.isLightMode ? Colors.white : MyColor.leaderboardColor,
                    ),
                    WinnerContainer(
                      height: 100.0,
                      winnerPosition: 3,
                      user: widget.users[2],
                      color: Colors.blue,
                      positionName: 25,
                      //themeColor: widget.isLightMode ? Colors.white : MyColor.leaderboardColor,
                    ),
                  ],
                ),
                Board(list: widget.users),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
