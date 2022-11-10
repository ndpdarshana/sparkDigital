import 'package:formz/formz.dart';
import 'package:sparkdigital/features/user/models/app_user.dart';

enum GenderInputError { empty }

class GenderInput extends FormzInput<Gender?, GenderInputError> {
  const GenderInput.pure() : super.pure(null);
  const GenderInput.dirty(Gender? value) : super.dirty(value);

  @override
  GenderInputError? validator(Gender? value) {
    if (value == null) return GenderInputError.empty;
    return null;
  }
}
