import 'dart:collection';

import 'package:do_an_di_dong/screens/user/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/authentication/authentication_controller.dart';
import '../screens/auth/authentication_view.dart';

class RouteApp extends ConsumerStatefulWidget {
  const RouteApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RouteApp();
}

class _RouteApp extends ConsumerState<RouteApp>{
  dynamic authenticationState;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    if(authenticationState.status == null) return;

    if (authenticationState.status == AuthenticationStatus.authenticated) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/', ModalRoute.withName('/'));
    } else {
      Navigator.pushNamedAndRemoveUntil(
          context, '/auth', ModalRoute.withName('/auth'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      routes: <String, WidgetBuilder>{
        '/': (context) => const Profile(),
        '/auth':(context) => const AuthenticationView(),
      },
    );
  }
}