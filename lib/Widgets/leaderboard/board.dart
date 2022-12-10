import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:flutter/material.dart';

import '../../models/leaderboard_obj.dart';
import 'contestant_list.dart';

class Board extends StatelessWidget{
  final List<LeaderBoardObj> list;
  const Board({Key? key, required this.list}) : super(key: key);

  List<Widget> listUser(List<LeaderBoardObj> list){
    List<Widget> contestants = [];

    for(LeaderBoardObj item in list){
      contestants.add(ContestantList(user: item));
    }

    return contestants;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        gradient: LinearGradient(colors:[
          Colors.yellow.shade600,
          Colors.orange,
          Colors.red,
        ]),
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Container(
          height: MediaQuery.of(context).size.height - 450.0,
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              colors: [Colors.brown.shade300, Colors.brown, Colors.brown.shade600],
            ),
          ),
          child: GridView.count(
            crossAxisCount: 1,
            childAspectRatio: 4.0,
            children: listUser(list),
          ),
        ),
      ),
    );
  }
}