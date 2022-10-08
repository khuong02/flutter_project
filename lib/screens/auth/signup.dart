import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../Utilities/animated_button.dart';
import '../../Utilities/loading_error.dart';
import '../../Widgets/auth/rounded_button_style.dart';
import '../../Widgets/auth/signin/email_field.dart';
import '../../Widgets/auth/signin/password_field.dart';
import '../../Widgets/auth/signup/name_field.dart';
import '../../Widgets/auth/signup/sign_up_button.dart';
import '../../Widgets/text_input_field.dart';
import '../../features/authentication/signup/signup_controller.dart';

class SignUp extends ConsumerWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignUpState>(
      signUpProvider,
      (previous, current) {
        if (current.status.isSubmissionInProgress) {
          LoadingSheet.show(context);
        } else if (current.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          ErrorDialog.show(context, "${current.errorMessage}");
        } else if (current.status.isSubmissionSuccess) {
          Navigator.of(context).pop();
        }
      },
    );

    return Column(
      children: const [
        NameField(),
        SizedBox(
          height: 16,
        ),
        EmailField(),
        SizedBox(
          height: 16,
        ),
        PasswordField(),
        SizedBox(
          height: 24,
        ),
        SignUpButton(),
      ],
    );
  }
}
