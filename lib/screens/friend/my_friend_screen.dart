import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../features/friend/list_friend.dart';

class MyFriendScreen extends StatefulWidget {
  const MyFriendScreen({Key? key}) : super(key: key);

  @override
  State<MyFriendScreen> createState() => _MyFriendScreenState();
}

class _MyFriendScreenState extends State<MyFriendScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Friend'),
      ),
      body: ListFriend(),
    );
  }
}
