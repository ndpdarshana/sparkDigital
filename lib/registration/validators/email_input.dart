import 'package:formz/formz.dart';

enum EmailInputError { empty, invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty(String value) : super.dirty(value);
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailInputError? validator(String? value) {
    if (value == null || value.isEmpty) return EmailInputError.empty;
    // if (_emailRegExp.hasMatch(value)) return EmailInputError.invalid;
    return null;
  }
}
