import 'dart:convert';

import 'package:do_an_di_dong/Utilities/my_error/error_dialog.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Providers/auth_repo_provider.dart';
import '../../../Utilities/nav_bar.dart';
import '../../../api/api.dart';
part 'signin_state.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
  (ref) => SignInController(ref.watch(authRepoProvider)),
);

class SignInController extends StateNotifier<SignInState> {
  final AuthenticationRepository _authenticationRepository;
  SignInController(this._authenticationRepository) : super(const SignInState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    );
  }

  void signIn(context) async {
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    Map<String, String> data = {
      'email': state.email.value,
      'password': state.password.value,
    };

    try {
      var res = await AuthenticationApi().login(data);

      var body = jsonDecode(res.body);
      if (body["status"] == 200) {
        final pref = await SharedPreferences.getInstance();
        await pref.setString('token', body["authorisation"]["token"]);

        state = state.copyWith(status: FormzStatus.submissionSuccess);
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      } else if (body["status"] == 500) {
        state = state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: "Email or password not correct");
      }
    } on SignInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.toString());
    }
  }
}
