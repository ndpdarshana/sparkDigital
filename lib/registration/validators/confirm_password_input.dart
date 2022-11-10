import 'package:formz/formz.dart';
import 'package:sparkdigital/registration/validators/password_input.dart';

enum ConfirmPasswordInputError { empty, invalid, notMatch }

class ConfirmPasswordInput extends FormzInput<String?, ConfirmPasswordInputError> {
  final PasswordInput password;

  const ConfirmPasswordInput.pure()
      : password = const PasswordInput.pure(),
        super.pure('');
  const ConfirmPasswordInput.dirty(String? value, this.password) : super.dirty(value);

  @override
  ConfirmPasswordInputError? validator(String? value) {
    if (value == null || value.isEmpty) return ConfirmPasswordInputError.empty;
    if (password.valid && value != password.value) return ConfirmPasswordInputError.notMatch;
    return null;
  }
}
