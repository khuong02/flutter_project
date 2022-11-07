import 'package:form_validators/form_validators.dart';

enum RepasswordValidationError { empty, invalid }

class Repassword extends FormzInput<String, RepasswordValidationError> {
  const Repassword.pure() : super.pure('');
  const Repassword.dirty([String value = '']) : super.dirty(value);

  @override
  RepasswordValidationError? validator(String value) {
    if (value.isEmpty) {
      return RepasswordValidationError.empty;
    } else if (value.length < 6) {
      return RepasswordValidationError.invalid;
    } else {
      return null;
    }
  }

  static String? showRepasswordErrorMessage(RepasswordValidationError? error) {
    if (error == RepasswordValidationError.empty) {
      return 'Empty Repassword';
    } else if (error == RepasswordValidationError.invalid) {
      return 'Invalid Repassword';
    } else {
      return null;
    }
  }
}
