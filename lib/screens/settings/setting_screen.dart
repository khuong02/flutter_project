import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget{
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen>{

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Setting screen"),
      ),
    );
  }
}