import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io' show Platform;

import 'features/authentication/authentication_controller.dart';
import 'screens/auth/authentication_view.dart';
import 'screens/user/user_profile.dart';
import 'Consts/firebase_options.dart';

void main() async {
  bool isIos = false;
  Platform.isIOS ? isIos = true : isIos = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // isIos
  //     ? await Firebase.initializeApp(
  //         name: "SecondaryApp",
  //         options: DefaultFirebaseOptions.ios,
  //       )
  //     : await Firebase.initializeApp(
  //         options: DefaultFirebaseOptions.android,
  //       );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authenticationState = ref.watch(authProvider);

    Widget getHome() {
      if (authenticationState.status == AuthenticationStatus.authenticated) {
        return const Profile();
      } else if (authenticationState.status ==
          AuthenticationStatus.unauthenticated) {
        return const AuthenticationView();
      } else {
        return const AuthenticationView();
      }
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: getHome(),
    );
  }
}
