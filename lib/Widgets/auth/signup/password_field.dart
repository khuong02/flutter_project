import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../../Utilities/size_fade_switcher.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Color(0xFFD0D0D0), width: 1)),
          child: TextField(
            onChanged: (password) =>
                signUpController.onPasswordChange(password),
            obscureText: obscure,
            decoration: InputDecoration(
              border: InputBorder.none,
              // errorText: errorText,
              hintText: "Password",
              hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Color(0xFFC2C2C2),
              ),
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
            ),
          ),
        ),
        SizeFadeSwitcher(
          child: (showError
                      ? Password.showPasswordErrorMessage(
                          signUpState.password.error)
                      : null) !=
                  null
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(16, 4, 16, 0),
                  child: Text(
                    Password.showPasswordErrorMessage(
                        signUpState.password.error)!,
                    style: TextStyle(color: Theme.of(context).errorColor),
                  ),
                )
              : const SizedBox.shrink(),
        )
      ],
    );
  }
}
