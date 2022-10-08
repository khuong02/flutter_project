import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../../Utilities/animated_button.dart';
import '../../../features/authentication/signup/signup_controller.dart';
import '../rounded_button_style.dart';

class SignUpButton extends ConsumerWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final signUpState = ref.watch(signUpProvider);
    final signUpController = ref.read(signUpProvider.notifier);
    final bool isValidated = signUpState.status.isValidated;
    return AnimatedButton(
      onTap: isValidated
          ? () => signUpController.signUpWithEmailAndPassword()
          : null,
      child: const RoundedButtonStyle(
        title: "Sign Up",
      ),
    );
  }
}
