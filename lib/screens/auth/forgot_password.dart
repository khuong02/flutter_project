import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';

import '../../Widgets/animated_shape/animated_shape.dart';
import '../../Utilities/loading_error.dart';

import '../../Widgets/text_input_field.dart';
import '../../features/authentication/forgot_password/forgot_password_controller.dart';

class ForgotPasswordView extends ConsumerWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

  String _getButtonText(FormzStatus status) {
    if (status.isSubmissionInProgress) {
      return "Requesting";
    } else if (status.isSubmissionFailure) {
      return "Failed";
    } else if (status.isSubmissionSuccess) {
      return "Done ✅";
    } else {
      return "Request";
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);
    final status = forgotPasswordState.status;

    ref.listen<ForgotPasswordState>(
      forgotPasswordProvider,
      (previous, current) {
        if (current.status.isSubmissionFailure) {
          Navigator.of(context).pop();
          ErrorDialog.show(context, "${current.errorMessage}");
        }
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const AnimatedShape(
              color: Color.fromARGB(255, 216, 244, 123),
              show: true,
              title: "Forgot Password",
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 100, 16, 0),
            ),
            TextInputField(
              hintText: "Please enter your Email",
              errorText:
                  Email.showEmailErrorMessage(forgotPasswordState.email.error),
              onChanged: (email) {
                ref.read(forgotPasswordProvider.notifier).onEmailChange(email);
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: status.isSubmissionInProgress
                      ? null
                      : () {
                          Navigator.of(context).pop();
                        },
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: status.isSubmissionInProgress ||
                          status.isSubmissionSuccess
                      ? null
                      : () {
                          ref
                              .read(forgotPasswordProvider.notifier)
                              .forgotPassword();
                        },
                  child: Text(_getButtonText(status)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
