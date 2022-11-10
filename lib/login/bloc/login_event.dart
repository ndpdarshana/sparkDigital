part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

class LoginIdChanged extends LoginEvent {
  final String id;

  const LoginIdChanged(this.id);

  @override
  List<Object?> get props => [id];
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  const LoginPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class LoginFormSubmitted extends LoginEvent {}
