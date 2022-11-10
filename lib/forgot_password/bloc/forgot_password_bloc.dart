import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/features/auth/auth_repository.dart';
import 'package:sparkdigital/forgot_password/validators/email_input.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository _authRepository;
  ForgotPasswordBloc()
      : _authRepository = AuthRepository(),
        super(const ForgotPasswordState()) {
    on<ForgotPasswordEmailChanged>(_onForgotPasswordEmailChanged);
    on<ForgotPasswordFormSubmitted>(_onForgotPasswordFormSubmitted);
  }

  void _onForgotPasswordEmailChanged(ForgotPasswordEmailChanged event, Emitter<ForgotPasswordState> emit) {
    final email = EmailInput.dirty(event.email);
    emit(state.copyWith(status: Formz.validate([email]), email: email));
  }

  void _onForgotPasswordFormSubmitted(ForgotPasswordFormSubmitted event, Emitter<ForgotPasswordState> emit) async {
    if (state.status == FormzStatus.valid) {
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      try {
        await _authRepository.forgotPassword(state.email.value);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } catch (_) {
        emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: 'Something went wrong'));
      }
    }
  }
}
