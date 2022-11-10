part of 'registration_bloc.dart';

abstract class RegistrationEvent extends Equatable {
  const RegistrationEvent();

  @override
  List<Object> get props => [];
}

class RegistrationNameChanged extends RegistrationEvent {
  final String name;

  const RegistrationNameChanged(this.name);

  @override
  List<Object> get props => [name];
}

class RegistrationBirthYearChanged extends RegistrationEvent {
  final int birthYear;

  const RegistrationBirthYearChanged(this.birthYear);

  @override
  List<Object> get props => [birthYear];
}

class RegistrationGenderChanged extends RegistrationEvent {
  final Gender gender;

  const RegistrationGenderChanged(this.gender);

  @override
  List<Object> get props => [gender];
}

class RegistrationEmailChanged extends RegistrationEvent {
  final String email;

  const RegistrationEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class RegistrationPasswordChanged extends RegistrationEvent {
  final String password;

  const RegistrationPasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RegistrationConfirmPasswordChanged extends RegistrationEvent {
  final String confirmPassword;

  const RegistrationConfirmPasswordChanged(this.confirmPassword);

  @override
  List<Object> get props => [confirmPassword];
}
