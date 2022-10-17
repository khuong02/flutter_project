import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContestantList extends StatefulWidget{
  const ContestantList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ContestantList();
}

class _ContestantList extends State<ContestantList>{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: MyColor.leaderboardColor,
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                clipBehavior: Clip.antiAlias,
                child: Image.network(
                  'https://images.unsplash.com/photo-1546587348-d12660c30c50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bmF0dXJhbHxlbnwwfHwwfHw%3D&w=1000&q=80',
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Name',style: TextStyle(color: Colors.white),),
                  Text('@Name',style: TextStyle(color: Colors.white54),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('1302',style: TextStyle(color: Colors.white),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}