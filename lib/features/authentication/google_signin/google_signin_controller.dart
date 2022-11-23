import 'dart:convert';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:do_an_di_dong/Utilities/nav_bar.dart';
import 'package:do_an_di_dong/api/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Providers/auth_repo_provider.dart';

final googleSignInProvider =
    StateNotifierProvider<GoogleSignInController, GoogleSignInState>(
  (ref) {
    final authenticationRepository = ref.watch(authRepoProvider);
    return GoogleSignInController(authenticationRepository);
  },
);

enum GoogleSignInState {
  initial,
  loading,
  success,
  error,
}

class GoogleSignInController extends StateNotifier<GoogleSignInState> {
  final AuthenticationRepository _authenticationRepository;

  GoogleSignInController(this._authenticationRepository)
      : super(GoogleSignInState.initial);

  Future<void> signInWithGoogle(context) async {
    state = GoogleSignInState.loading;

    try {
      final isNewUser = await _authenticationRepository.signInWithGoogle();

      if (isNewUser != null && isNewUser) {
        // white to database
        // call cloud firestore repository
      }
      var firebaseIdToken = FirebaseAuth.instance.currentUser!.getIdToken();
      String token = await firebaseIdToken;

      var res = await AuthenticationApi().verifyToken(token);

      var body = jsonDecode(res.body);
      if (body["status"] == 200) {
        final pref = await SharedPreferences.getInstance();
        await pref.setString('token', body["token"]);

        state = GoogleSignInState.success;
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NavBar()));
      } else {
        state = GoogleSignInState.error;
      }
    } on SignInWithGoogleFailure catch (_) {
      state = GoogleSignInState.error;
    }
  }
}
