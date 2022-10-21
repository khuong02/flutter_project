import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/board.dart';
import 'package:do_an_di_dong/Widgets/leaderboard/winner.dart';
import 'package:do_an_di_dong/features/leaderboard/leaderboard.dart';
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
    return const Leaderboard();
  }
}