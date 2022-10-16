import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:flutter/material.dart';

class Board extends StatelessWidget{

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
        padding: const EdgeInsets.all(2.0),
        child: Container(
          height: 300.0,
          decoration: const BoxDecoration(
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: MyColor.leaderboardColor,
          ),
        ),
      ),
    );
  }

}