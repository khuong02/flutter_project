import 'dart:convert';

import 'package:do_an_di_dong/Utilities/nav_bar.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../Providers/auth_repo_provider.dart';
import '../../../models/user.dart';

part 'signup_state.dart';

final signUpProvider =
    StateNotifierProvider.autoDispose<SignUpController, SignUpState>(
  (ref) => SignUpController(ref.watch(authRepoProvider)),
);

class SignUpController extends StateNotifier<SignUpState> {
  final AuthenticationRepository _authenticationRepository;
  SignUpController(this._authenticationRepository) : super(const SignUpState());

  void onNameChange(String value) {
    final name = Name.dirty(value);
    state = state.copyWith(
      name: name,
      status: Formz.validate([
        name,
        state.email,
        state.password,
        state.repassword,
      ]),
    );
  }

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      status: Formz.validate(
        [
          state.name,
          email,
          state.password,
          state.repassword,
        ],
      ),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      status: Formz.validate(
        [
          state.name,
          state.email,
          password,
          state.repassword,
        ],
      ),
    );
  }

  void onRepasswordChange(String value) {
    final repassword = Repassword.dirty(value);
    state = state.copyWith(
      repassword: repassword,
      status: Formz.validate(
        [
          state.name,
          state.email,
          state.password,
          repassword,
        ],
      ),
    );
  }

  void signUp(context) async {
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    Map<String, String> data = {
      'username': state.name.value,
      'email': state.email.value,
      'password': state.password.value,
      'cf_password': state.repassword.value,
    };

    try {
      var res = await CallApi().register(data);

      var body = jsonDecode(res.body);
      if (body["status"] == 200) {
        final pref = await SharedPreferences.getInstance();
        await pref.setString('token', body["authorisation"]["token"]);

        state = state.copyWith(status: FormzStatus.submissionSuccess);

        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      } else {
        state = state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: "Fail to register");
      }
    } on SignUpWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.toString());
    }
  }
}
