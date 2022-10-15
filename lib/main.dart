import 'package:do_an_di_dong/routers/router.dart';
import 'package:do_an_di_dong/screens/auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io' show Platform;

import 'features/authentication/authentication_controller.dart';
import 'screens/auth/authentication_view.dart';
import 'screens/user/user_profile.dart';
import 'Consts/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    // final authenticationState = ref.watch(authProvider);
    //
    // Widget getHome() {
    //if (authenticationState.status == AuthenticationStatus.authenticated) {
    //     return const Profile();
    //   } else if (authenticationState.status ==
    //       AuthenticationStatus.unauthenticated) {
    //     return const AuthenticationView();
    //   } else {
    //     return const AuthenticationView();
    //   }
    // }

    return RouteApp();
  }
}
