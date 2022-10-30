import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../../features/authentication/signup/signup_controller.dart';
import '../../text_input_field.dart';

class RepasswordField extends ConsumerStatefulWidget {
  RepasswordField({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => RepasswordFieldState();
}

class RepasswordFieldState extends ConsumerState<RepasswordField> {
  bool obscure = true;
  bool icon = true;
  @override
  Widget build(BuildContext context) {
    final signUpState = ref.watch(signUpProvider);
    final showError = signUpState.password.invalid;
    final signUpController = ref.read(signUpProvider.notifier);
    return TextInputField(
      hintText: "Confirm password",
      obscureText: obscure,
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
          ? Repassword.showRepasswordErrorMessage(signUpState.repassword.error)
          : null,
      onChanged: (repassword) =>
          signUpController.onRepasswordChange(repassword),
    );
  }
}
