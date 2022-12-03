import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/models/leaderboard_obj.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Consts/cosntants.dart';

class ContestantList extends StatefulWidget{
  final LeaderBoardObj user;
  const ContestantList({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContestantList();
}

class _ContestantList extends State<ContestantList>{

  String formatTime(int time){
    double min = time / 60;
    double second = time % 60;

    double hour = int.parse(min.toString().split(".")[0]) / 60;

    if(min < 1){
      return second.toString() + "s";
    }

    if (min < 60){
      return min.toString().split(".")[0] + "m" + second.toString() + "s";
    }

    return min.toString().split(".")[0] + "h" +  min.toString().split(".")[0] + "m" + second.toString() + "s";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:  const BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(colors:[
            Colors.yellow.shade600,
            Colors.orange,
            Colors.red,
          ]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(
                      widget.user.avatar!,
                      width: 50.0,
                      height: 50.0,
                      fit: BoxFit.fill,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return Image.network(
                          Constants.imageUri,
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.fill,
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.user.username!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Text(widget.user.email!,style: TextStyle(color: Colors.black54),),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.user.score!.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          formatTime(widget.user.time!),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

