import 'package:do_an_di_dong/api/leaderboard_api/leaderboard_api.dart';
import 'package:do_an_di_dong/features/leaderboard/leaderboard.dart';
import 'package:do_an_di_dong/models/leaderboard_obj.dart';

import 'package:do_an_di_dong/Consts/cosntants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget{
  late bool lightMode;
  LeaderboardScreen({Key? key, required this.lightMode}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LeaderboardScreen();
}

class _LeaderboardScreen extends State<LeaderboardScreen>{
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LeaderBoardObj>>(
      future: LeaderBoardApi.getLeaderBoard(),
      builder: (context,snapshot) {
        if(snapshot.hasData){
          List<LeaderBoardObj> users = snapshot.data!;

          return Leaderboard(users: users, isLightMode: widget.lightMode,);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}