part of 'registration_bloc.dart';

class RegistrationState extends Equatable {
  final FormzStatus status;
  final NameInput name;
  final BirthYearInput birthYear;
  final EmailInput email;
  final PasswordInput password;
  final ConfirmPasswordInput confirmPassword;

  const RegistrationState({
    this.status = FormzStatus.pure,
    this.name = const NameInput.pure(),
    this.birthYear = const BirthYearInput.pure(),
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.confirmPassword = const ConfirmPasswordInput.pure(),
  });

  @override
  List<Object> get props => [
        status,
        name,
        birthYear,
        email,
        password,
        confirmPassword,
      ];

  RegistrationState copyWith({
    FormzStatus? status,
    NameInput? name,
    BirthYearInput? birthYear,
    EmailInput? email,
    PasswordInput? password,
    ConfirmPasswordInput? confirmPassword,
  }) =>
      RegistrationState(
        status: status ?? this.status,
        name: name ?? this.name,
        birthYear: birthYear ?? this.birthYear,
        email: email ?? this.email,
        password: password ?? this.password,
        confirmPassword: confirmPassword ?? this.confirmPassword,
      );
}
