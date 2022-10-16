import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class WinnerContainer extends StatelessWidget{
  // bool isFirst;
  // Color color;
  // int winnerPosition;
  // String winnerName;
  // int rank;
  final double height;

  const WinnerContainer({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
         children: [
           Padding(
             padding: const EdgeInsets.only(
               top: 40.0,
             ),
             child: Center(
               child: Container(
                 height: height,
                 width: 90.0,
                 decoration: BoxDecoration(
                   color: MyColor.leaderboardColor,
                   borderRadius: const BorderRadius.only(
                     topLeft: Radius.circular(40.0),
                     topRight: Radius.circular(40.0),
                   ),
                   border: Border.all(color: Colors.red,width: 2.0),
                 ),
               ),
             ),
           ),
           Center(
             child: Stack(
               children: [
                 // Image.asset('assets/images/art and literature.png',height: 80.0,width: 80.0,),
                 Padding(
                   padding: const EdgeInsets.only(top:10.0),
                   child: Container(
                     height: 70.0,
                     width: 90.0,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         border: Border.all(color:Colors.red),
                         image: DecorationImage(
                           image: new AssetImage('assets/images/art and literature.png'),
                           fit: BoxFit.cover,
                         )
                     ),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.only(
                     top: 70.0,
                     left: 35.0,
                   ),
                   child: Container(
                     height: 20.0,
                     width: 20.0,
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.red,
                     ),
                     child: const Center(
                       child: Text('1',style: TextStyle(color: Colors.white),),
                     ),
                   ),
                 ),
               ],
             ),
           ),
           Padding(
             padding: const EdgeInsets.only(
               top: 100.0,
               left: 3.0,
             ),
             child: Center(
               child: Column(
                 children: [
                   Padding(
                     padding: const EdgeInsets.only(
                       left: 8.0,
                       right: 8.0,
                     ),
                     child: Column(
                       children: const [
                         Text(
                           'Dao Vinh Khuong',
                           style: TextStyle(color: Colors.white,fontSize: 9.0,
                               fontWeight: FontWeight.w600),
                         ),
                         Text(
                           '1302',
                           style: TextStyle(color: Colors.white,fontSize: 9.0,
                               fontWeight: FontWeight.w600),
                         ),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
           ),
         ],
      ),
    );
  }
}

// Column(
// children: [
// Container(
// alignment: Alignment.center,
// margin: const EdgeInsets.all(10),
// height: 40,
// width: 60,
// decoration: BoxDecoration(
// color: const Color(0xFF202020),
// shape: BoxShape.rectangle,
// borderRadius: BorderRadius.circular(10)),
// child: const Text(
// 'Top 1',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 15,
// letterSpacing: 0.5,
// color: Color(0xFFE7E7E7),
// ),
// ),
// ),
// ],
// ),

