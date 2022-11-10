part of 'forgot_password_bloc.dart';

class ForgotPasswordState extends Equatable {
  final FormzStatus status;
  final EmailInput email;
  final String? errorMessage;

  const ForgotPasswordState({
    this.status = FormzStatus.pure,
    this.email = const EmailInput.pure(),
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, email, errorMessage];

  ForgotPasswordState copyWith({
    FormzStatus? status,
    EmailInput? email,
    String? errorMessage,
  }) =>
      ForgotPasswordState(
        status: status ?? this.status,
        email: email ?? this.email,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
