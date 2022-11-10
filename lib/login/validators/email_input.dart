import 'package:formz/formz.dart';

enum EmailInputError { invalid }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure() : super.pure('');
  const EmailInput.dirty(String value) : super.dirty(value);
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  @override
  EmailInputError? validator(String value) {
    return _emailRegExp.hasMatch(value) ? null : EmailInputError.invalid;
  }
}
