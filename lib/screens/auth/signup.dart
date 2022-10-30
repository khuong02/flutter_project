import 'package:do_an_di_dong/Widgets/auth/signup/repassword_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../Utilities/loading/loading_sheet.dart';
import '../../Utilities/my_error/error_dialog.dart';
import '../../Widgets/auth/signup/email_field.dart';
import '../../Widgets/auth/signup/password_field.dart';
import '../../Widgets/auth/signup/name_field.dart';
import '../../Widgets/auth/signup/sign_up_button.dart';
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
      children: [
        const NameField(),
        const SizedBox(
          height: 16,
        ),
        const EmailField(),
        const SizedBox(
          height: 16,
        ),
        PasswordField(),
        const SizedBox(
          height: 24,
        ),
        RepasswordField(),
        const SizedBox(
          height: 24,
        ),
        const SignUpButton(),
      ],
    );
  }
}
