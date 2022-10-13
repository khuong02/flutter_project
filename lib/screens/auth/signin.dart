import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../Utilities/loading/loading_sheet.dart';
import '../../Utilities/my_error/error_dialog.dart';
import '../../Widgets/auth/signin/email_field.dart';
import '../../Widgets/auth/signin/forgot_password_button.dart';
import '../../Widgets/auth/signin/password_field.dart';
import '../../Widgets/auth/signin/sign_in_button.dart';
import '../../Widgets/auth/signin/google_signin_button.dart';
import '../../features/authentication/signin/signin_controller.dart';

class SignIn extends ConsumerWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<SignInState>(
      signInProvider,
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
        EmailField(),
        SizedBox(
          height: 16,
        ),
        PasswordField(),
        ForgotPasswordButton(),
        SizedBox(
          height: 24,
        ),
        SignInButton(),
        Divider(),
        GoogleSignInButton(),
      ],
    );
  }
}
