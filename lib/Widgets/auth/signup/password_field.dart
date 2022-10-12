import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../../features/authentication/signup/signup_controller.dart';
import '../../text_input_field.dart';

class PasswordField extends ConsumerStatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => PasswordFieldState();
}

class PasswordFieldState extends ConsumerState<PasswordField> {
  bool obscure = true;
  bool icon = true;
  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.password.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: "Password",
      obscureText: obscure,
      suffix: GestureDetector(
        child: icon
            ? Icon(
                CupertinoIcons.eye_slash,
                size: 20,
                color: Colors.black,
              )
            : Icon(
                CupertinoIcons.eye,
                size: 20,
                color: Colors.black,
              ),
        onTap: () {
          setState(() {
            obscure = !obscure;
            icon = !icon;
          });
        },
      ),
      errorText: showError
          ? Password.showPasswordErrorMessage(signUpState.password.error)
          : null,
      onChanged: (password) => signUpController.onPasswordChange(password),
    );
  }
}
