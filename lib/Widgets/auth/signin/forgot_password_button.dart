import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../screens/auth/forgot_password.dart';

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (_) => const ForgotPasswordView(),
            fullscreenDialog: true));
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(
            "Forgot Password",
            style: TextStyle(color: Color(0xFF6574FF)),
          ),
        ),
      ),
    );
  }
}
