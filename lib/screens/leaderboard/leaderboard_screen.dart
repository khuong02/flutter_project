import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/screens/leaderboard/board.dart';
import 'package:do_an_di_dong/screens/leaderboard/winner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget{
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LeaderboardScreen();
}

class _LeaderboardScreen extends State<LeaderboardScreen>{

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: MyColor.leaderboardBackGroundColor,
      ),
      child: Scaffold(
        backgroundColor: MyColor.leaderboardBackGroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 8.0,
              right: 8.0,
            ),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(colors:[
                      Colors.yellow.shade600,
                      Colors.orange,
                      Colors.red,
                    ]),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2.5),
                    child: Container(
                      height: 60.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: MyColor.leaderboardColor,
                      ),
                      child: const Center(
                        child: Text(
                          'LeaderBoard',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              letterSpacing: 1.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    WinnerContainer(
                      height: 120.0,
                      winnerPosition: 2,
                      winnerName: 'winner2',
                      color: Colors.yellow,
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