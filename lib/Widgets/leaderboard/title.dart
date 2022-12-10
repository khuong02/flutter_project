import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Consts/my_color/my_color.dart';

class TitleWidget extends StatelessWidget{
  Color color;
  TitleWidget({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            color: color,
          ),
          child: Center(
            child: Text(
              'LeaderBoard',
              style: TextStyle(
                  color: color == MyColor.leaderboardBackGroundColor ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.0,
                  letterSpacing: 1.0),
            ),
          ),
        ),
      ),
    );
  }
}