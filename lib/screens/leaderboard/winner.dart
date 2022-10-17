import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class WinnerContainer extends StatelessWidget{
  final bool? isFirst;
  final Color? color;
  final int? winnerPosition;
  final String? winnerName;
  final int? rank;
  final double height;

  const WinnerContainer({Key? key, required this.height, this.isFirst, this.color, this.winnerPosition, this.winnerName, this.rank}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
         children: [
           Stack(
             children: [
               //box name and rank
               Padding(
                 padding: const EdgeInsets.only(
                   top: 40.0,
                 ),
                 child: Center(
                   child: Container(
                     height: height,
                     width: 90.0,
                     decoration: BoxDecoration(
                       gradient: LinearGradient(colors:[
                         Colors.yellow.shade600,
                         Colors.orange,
                         Colors.red,
                       ]),
                       borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(40.0),
                         topRight: Radius.circular(40.0),
                       ),
                       border: Border.all(color: Colors.amber,width: 2.5),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(1.0),
                       child: Container(
                         height: height,
                         width: 90.0,
                         decoration: const BoxDecoration(
                           color: MyColor.leaderboardColor,
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(40.0),
                             topRight: Radius.circular(40.0),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
               //box name
               Padding(
                 padding: const EdgeInsets.only(
                   top: 100.0,
                   left: 17.0,
                 ),
                 child: Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Padding(
                         padding: const EdgeInsets.only(
                           left: 8.0,
                           right: 8.0,
                         ),
                         child: Column(
                           children: [
                             Text(
                               winnerName ?? 'Dao Vinh Khuong',
                               style: const TextStyle(color: Colors.white,fontSize: 11.0,
                                   fontWeight: FontWeight.w600),
                             ),
                             Text(
                               winnerPosition != null ? winnerPosition.toString() : '1',
                               style: TextStyle(color: color ?? Colors.white,fontSize: 14.0,
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
           Center(
             child: Stack(
               children: [
                 // avatar
                 Padding(
                   padding: const EdgeInsets.only(top:10.0),
                   child: Container(
                     height: 70.0,
                     width: 90.0,
                     decoration: BoxDecoration(
                         shape: BoxShape.circle,
                         gradient: LinearGradient(colors:[
                           Colors.yellow.shade600,
                           Colors.orange,
                           Colors.red,
                         ]),
                         border: Border.all(color: Colors.amber),
                         image: const DecorationImage(
                           image: NetworkImage('https://images.unsplash.com/photo-1546587348-d12660c30c50?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OHx8bmF0dXJhbHxlbnwwfHwwfHw%3D&w=1000&q=80'),
                           fit: BoxFit.cover,
                         )
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(2.5),
                       child: Container(
                         height: 70.0,
                         width: 90.0,
                         decoration: const BoxDecoration(
                             shape: BoxShape.circle,
                         ),
                       ),
                     ),
                   ),
                 ),
                 // rank
                 Padding(
                   padding: const EdgeInsets.only(
                     top: 70.0,
                     left: 35.0,
                   ),
                   child: Container(
                     height: 20.0,
                     width: 20.0,
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: color ?? Colors.red,
                     ),
                     child:  Center(
                       child: Text(winnerPosition != null ? winnerPosition.toString() : '1' ,style: TextStyle(color: Colors.white),),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ],
      ),
    );
  }
}

