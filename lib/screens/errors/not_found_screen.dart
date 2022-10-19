import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotFoundScreen extends StatefulWidget{
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NotFoundScreen();
}

class _NotFoundScreen extends State<NotFoundScreen>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Not Found 404"),
      ),
    );
  }
}