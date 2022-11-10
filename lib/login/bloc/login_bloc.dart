import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/features/auth/auth_repository.dart';
import 'package:sparkdigital/login/validators/email_input.dart';
import 'package:sparkdigital/login/validators/password_input.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  LoginBloc()
      : _authRepository = AuthRepository(),
        super(const LoginState()) {
    on<LoginIdChanged>(_onLoginIdChanged);
    on<LoginPasswordChanged>(_onLoginPasswordChanged);
    on<LoginFormSubmitted>(_onLoginSubmitted);
  }

  void _onLoginIdChanged(LoginIdChanged event, Emitter<LoginState> emit) {
    final email = EmailInput.dirty(event.id);
    emit(state.copyWith(status: Formz.validate([email, state.password]), email: email));
  }

  void _onLoginPasswordChanged(LoginPasswordChanged event, Emitter<LoginState> emit) {
    final password = PasswordInput.dirty(event.password);
    emit(state.copyWith(status: Formz.validate([state.email, password]), password: password));
  }

  void _onLoginSubmitted(LoginFormSubmitted event, Emitter<LoginState> emit) async {
    if (state.status == FormzStatus.valid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authRepository.signin(email: state.email.value, password: state.password.value);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } on AuthInvalidUsernameOrPasswordException catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: 'Invalid username or password'));
      } on AuthPermissionDenierdException catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: 'User login denied'));
      } on AuthException catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: 'Authentication failed'));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: 'Something went wrong'));
      }
    }
  }
}
