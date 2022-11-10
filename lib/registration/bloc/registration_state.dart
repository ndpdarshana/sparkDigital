part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final FormzStatus status;
  final NameInput name;
  final BirthYearInput birthYear;
  final GenderInput gender;
  final EmailInput email;
  final PasswordInput password;
  final ConfirmPasswordInput confirmPassword;
  final bool isUserAgreementChecked;

  const RegistrationState({
    this.status = FormzStatus.pure,
    this.name = const NameInput.pure(),
    this.birthYear = const BirthYearInput.pure(),
    this.gender = const GenderInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmPasswordInput.pure(),
    this.isUserAgreementChecked = false,
  });

  @override
  List<Object> get props => [
        status,
        name,
        birthYear,
        gender,
        email,
        password,
        confirmPassword,
        isUserAgreementChecked,
      ];

  RegistrationState copyWith({
    FormzStatus? status,
    NameInput? name,
    BirthYearInput? birthYear,
    GenderInput? gender,
    EmailInput? email,
    PasswordInput? password,
    ConfirmPasswordInput? confirmPassword,
    bool? isUserAgreementChecked,
  }) =>
      RegistrationState(
        status: status ?? this.status,
        name: name ?? this.name,
        birthYear: birthYear ?? this.birthYear,
        gender: gender ?? this.gender,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
        isUserAgreementChecked: isUserAgreementChecked ?? this.isUserAgreementChecked,
      );
}
