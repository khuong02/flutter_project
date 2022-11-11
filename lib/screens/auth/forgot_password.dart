import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import 'package:email_validator/email_validator.dart';
import '../../Utilities/my_error/error_dialog.dart';
import '../../Widgets/animated_shape/animated_shape.dart';

import '../../Widgets/text_input_field.dart';
import '../../features/authentication/forgot_password/forgot_password_controller.dart';

final _emailController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class ForgotPasswordView extends ConsumerWidget {
  ForgotPasswordView({
    Key? key,
  }) : super(key: key);

  bool isValidator = false;
  bool _keyboardVisible = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forgotPasswordState = ref.watch(forgotPasswordProvider);
    final status = forgotPasswordState.status;

    _keyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

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
              padding: EdgeInsets.fromLTRB(16, 50, 16, 0),
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: const EdgeInsets.all(14),
                        child: Text("Please enter a email"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border:
                                Border.all(color: Color(0xFFD0D0D0), width: 1)),
                        child: TextFormField(
                          controller: _emailController,
                          // ignore: prefer_const_constructors
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFC2C2C2),
                            ),
                          ),
                          onChanged: (value) {
                            if (EmailValidator.validate(value)) {
                              isValidator = true;
                            } else {
                              isValidator = false;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: ElevatedButton(
                          onPressed: _keyboardVisible
                              ? null
                              : !isValidator
                                  ? null
                                  : () {
                                      // Validate returns true if the form is valid, or false otherwise.
                                      if (_formKey.currentState!.validate()) {
                                        // If the form is valid, display a snackbar. In the real world,
                                        // you'd often call a server or save the information in a database.
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content: Text('Processing Data')),
                                        );
                                      }
                                    },
                          child: const Text('Submit'),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
