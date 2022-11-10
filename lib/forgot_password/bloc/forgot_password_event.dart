part of 'forgot_password_bloc.dart';

abstract class ForgotPasswordEvent extends Equatable {
  const ForgotPasswordEvent();

  @override
  List<Object> get props => [];
}

class ForgotPasswordEmailChanged extends ForgotPasswordEvent {
  final String email;

  const ForgotPasswordEmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class ForgotPasswordFormSubmitted extends ForgotPasswordEvent {}
