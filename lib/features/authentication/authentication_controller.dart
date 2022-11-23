import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:do_an_di_dong/screens/auth/authentication_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Providers/auth_repo_provider.dart';

part 'authentication_state.dart';

final authProvider = StateNotifierProvider<AuthController, AuthenticationState>(
  (ref) => AuthController(ref.watch(authRepoProvider)),
);

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authRepository;
  late final StreamSubscription _streamSubscription;

  AuthController(this._authRepository)
      : super(const AuthenticationState.unauthenticated()) {
    _streamSubscription =
        _authRepository.user.listen((user) => _onUserChanged(user));
  }
  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      state = const AuthenticationState.unauthenticated();
    } else {
      state = AuthenticationState.authenticated(user);
    }
  }

  void onSignOut(context) async {
    final pref = await SharedPreferences.getInstance();
    await pref.remove('token');
    Navigator.pop(context);
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const AuthenticationView()));
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}
