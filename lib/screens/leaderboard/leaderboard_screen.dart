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
    return const Scaffold(
      body: Center(
        child: Text("Leaderboard screen"),
      ),
    );
  }
}