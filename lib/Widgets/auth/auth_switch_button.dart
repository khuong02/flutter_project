import 'package:flutter/material.dart';

import '../../Utilities/slide_fade_switcher.dart';

const _kTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.lightBlue,
);

class AuthSwitchButton extends StatelessWidget {
  final bool showSignIn;
  final VoidCallback onTap;
  const AuthSwitchButton({
    Key? key,
    required this.showSignIn,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 30,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16.0),
          child: SlideFadeSwitcher(
              child: showSignIn
                  ? const Text.rich(
                      TextSpan(
                        text: "Don't have account?",
                        children: [
                          TextSpan(text: " Sign up", style: _kTextStyle)
                        ],
                      ),
                      key: ValueKey("SignUp"),
                    )
                  : const Text.rich(
                      TextSpan(
                        text: "Already have account?",
                        children: [
                          TextSpan(text: " Sign in", style: _kTextStyle)
                        ],
                      ),
                      key: ValueKey("SignIn"),
                    )),
        ),
      ),
    );
  }
}
