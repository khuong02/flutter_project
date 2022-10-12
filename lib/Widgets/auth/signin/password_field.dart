import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../../Utilities/size_fade_switcher.dart';
import '../../../features/authentication/signin/signin_controller.dart';
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
    final signInState = ref.watch(signInProvider);
    final bool showError = signInState.password.invalid;
    final signInController = ref.read(signInProvider.notifier);
    return TextInputField(
      hintText: "Password",
      obscureText: true,
      suffix: GestureDetector(
        child: icon
            ? const Icon(
                CupertinoIcons.eye_slash,
                size: 20,
                color: Colors.black,
              )
            : const Icon(
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
          ? Password.showPasswordErrorMessage(signInState.password.error)
          : null,
      onChanged: (password) => signInController.onPasswordChange(password),
    );
  }
}
