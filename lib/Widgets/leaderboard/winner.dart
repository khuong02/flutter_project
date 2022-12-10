import 'dart:convert';

import 'package:do_an_di_dong/Consts/my_color/my_color.dart';
import 'package:do_an_di_dong/models/leaderboard_obj.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:http/http.dart' as http;

import '../../Consts/cosntants.dart';

class WinnerContainer extends StatefulWidget{
  final bool? isFirst;
  final Color? color;
  final int? winnerPosition;
  final LeaderBoardObj user;
  final double height;
  final double positionName;

  WinnerContainer({
    Key? key,
    required this.height,
    this.isFirst,
    this.color,
    this.winnerPosition,
    required this.user,
    required this.positionName,
  }) : super(key: key);

  @override
  State<WinnerContainer> createState() => _WinnerContainerState();
}

class _WinnerContainerState extends State<WinnerContainer> {
  late String img = widget.user.avatar!;

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
                     height: widget.height,
                     width: 90.0,
                     decoration: BoxDecoration(
                       borderRadius: const BorderRadius.only(
                         topLeft: Radius.circular(40.0),
                         topRight: Radius.circular(40.0),
                       ),
                       border: Border.all(color: Colors.amber,width: 2.5),
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(1.0),
                       child: Container(
                         height: widget.height,
                         width: 90.0,
                         decoration: BoxDecoration(
                           gradient: LinearGradient(
                             begin: Alignment.centerLeft,
                             end: Alignment.centerRight,
                             colors: [Colors.orangeAccent.shade200, Colors.orangeAccent ,Colors.orangeAccent.shade700],
                           ),
                           borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(40.0),
                             topRight: Radius.circular(40.0),
                           ),
                         ),
                         child: Padding(
                           padding: const EdgeInsets.all(0),
                           child: Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Padding(
                                   padding: EdgeInsets.only(
                                      top: widget.positionName,
                                   ),
                                   child: Center(
                                     child: Text(
                                       widget.user.username!,
                                       textAlign: TextAlign.center,
                                       style: const TextStyle(color: Colors.white,fontSize: 11.0,
                                           fontWeight: FontWeight.w600),
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ),
                     ),
                   ),
                 ),
               ),
               //box name
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
                         image:  DecorationImage(
                           image: NetworkImage(img),
                           onError: (error, stackTrace) {
                             setState((){
                               img = Constants.imageUri;
                             });
                           },
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
                       color: widget.color ?? Colors.red,
                     ),
                     child:  Center(
                       child: Text(widget.winnerPosition != null ? widget.winnerPosition.toString() : '1' ,style: TextStyle(color: Colors.white),),
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

