import 'package:formz/formz.dart';

enum BirthYearInputError { empty, invalid }

class BirthYearInput extends FormzInput<int?, BirthYearInputError> {
  const BirthYearInput.pure() : super.pure(null);
  const BirthYearInput.dirty(int? value) : super.dirty(value);

  @override
  BirthYearInputError? validator(int? value) {
    if (value == null) return BirthYearInputError.empty;

    int currentYear = DateTime.now().year;
    if (value > currentYear && value < currentYear - 50) return BirthYearInputError.invalid;
    return null;
  }
}
