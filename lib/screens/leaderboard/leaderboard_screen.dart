import 'package:do_an_di_dong/api/api.dart';
import 'package:do_an_di_dong/features/leaderboard/leaderboard.dart';
import 'package:do_an_di_dong/models/leaderboard_obj.dart';

import 'package:flutter/material.dart';

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LeaderboardScreen();
}

class _LeaderboardScreen extends State<LeaderboardScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<LeaderBoardObj>>(
      future: LeaderBoardApi.getLeaderBoard(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<LeaderBoardObj> users = snapshot.data!;

          return Leaderboard(users: users);
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
