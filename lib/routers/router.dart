import 'package:do_an_di_dong/screens/auth/signin.dart';
import 'package:do_an_di_dong/screens/user/user_profile.dart';
import 'package:flutter/material.dart';

class Route extends StatefulWidget {
  const Route({Key? key}) : super(key: key);

  @override
  _Route createState() => _Route();
}

class _Route extends State<Route>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const Profile(),
        '/login':(context) => const SignIn(),
      },
    );
  }
}