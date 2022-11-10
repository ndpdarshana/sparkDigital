part of 'login_bloc.dart';

class LoginState extends Equatable {
  final FormzStatus status;
  final EmailInput email;
  final PasswordInput password;
  final String? errorMessage;

  const LoginState({
    this.status = FormzStatus.pure,
    this.email = const EmailInput.pure(),
    this.password = const PasswordInput.pure(),
    this.errorMessage,
  });

  @override
  List<Object?> get props => [status, email, password, errorMessage];

  LoginState copyWith({
    FormzStatus? status,
    EmailInput? email,
    PasswordInput? password,
    String? errorMessage,
  }) =>
      LoginState(
        status: status ?? this.status,
        email: email ?? this.email,
        password: password ?? this.password,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
