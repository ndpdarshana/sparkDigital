import 'package:formz/formz.dart';

enum NameInputError { empty, invalid }

class NameInput extends FormzInput<String?, NameInputError> {
  const NameInput.pure() : super.pure('');
  const NameInput.dirty(String? value) : super.dirty(value);

  @override
  NameInputError? validator(String? value) {
    if (value == null) return NameInputError.empty;
    if (value.length < 2) return NameInputError.invalid;
    return null;
  }
}
