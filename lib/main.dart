import 'package:do_an_di_dong/Utilities/nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/token_obj.dart';
import 'screens/auth/authentication_view.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    getHome();
    getToken();
    super.initState();
  }

  Future<TokenObj> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return TokenObj(
      token: prefs.getString('token') ?? '',
      loading: false,
    );
  }

  Widget getHome() {
    return FutureBuilder<TokenObj>(
      future: getToken(),
      initialData: TokenObj(token: '', loading: true),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          TokenObj data = snapshot.data!;
          if (data.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: data.token != '' ? NavBar() : const AuthenticationView(),
          );
        }
        return const Scaffold(
          resizeToAvoidBottomInset: false,
          body: AuthenticationView(),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: getHome(),
    );
  }
}
