import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListFriend extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text('Khuong'),
            subtitle: Text('khuong@gmail.com'),
          ),
        ),
      ],
    );
  }
}