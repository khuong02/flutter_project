import 'package:authentication_repository/authentication_repository.dart';
import 'package:do_an_di_dong/api/authentication_api/authentication_api.dart';
import 'package:do_an_di_dong/features/authentication/authentication_controller.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_validators/form_validators.dart';
import '../../../Providers/auth_repo_provider.dart';

part 'forgot_password_state.dart';

final forgotPasswordProvider = StateNotifierProvider.autoDispose<
    ForgotPasswordController, ForgotPasswordState>(
  (ref) => ForgotPasswordController(
    ref.watch(authRepoProvider),
  ),
);

class ForgotPasswordController extends StateNotifier<ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;
  ForgotPasswordController(this._authenticationRepository)
      : super(const ForgotPasswordState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      status: Formz.validate(
        [email],
      ),
    );
  }

  Future<void> forgotPassword() async {
    if (!state.status.isValidated) return;
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      Map<String, dynamic> data = {
        'email': state.email.value,
        'roles': 0,
      };
      await AuthenticationApi().ForgotPassword(data);
      state = state.copyWith(status: FormzStatus.submissionSuccess);
    } on ForgotPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.code);
    }
  }
}
