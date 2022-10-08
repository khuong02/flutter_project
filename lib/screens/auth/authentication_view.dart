import 'package:flutter/material.dart';
import '../../Widgets/animated_shape/animated_shape.dart';
import '../../Widgets/auth/auth_switch_button.dart';
import '../../Utilities/slide_fade_switcher.dart';
import 'signin.dart';
import 'signup.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  bool _showSignIn = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: [
        Padding(
            padding: const EdgeInsets.fromLTRB(16, 220, 16, 0),
            child: SlideFadeSwitcher(
              child: _showSignIn ? const SignIn() : const SignUp(),
            )),
        const AnimatedShape(
          color: Color(0xFF595DC6),
          show: true,
          title: "Sign Up",
        ),
        AnimatedShape(
          color: Color(0xFFFC5F8E),
          show: !_showSignIn,
          title: "Sign In",
        ),
        AuthSwitchButton(
            showSignIn: _showSignIn,
            onTap: () {
              setState(() {
                _showSignIn = !_showSignIn;
              });
            })
      ]),
    );
  }
}
