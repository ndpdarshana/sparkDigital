import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/bloc/app_bloc.dart';
import 'package:sparkdigital/features/user/models/app_user.dart';
import 'package:sparkdigital/registration/validators/birth_year_input.dart';
import 'package:sparkdigital/registration/validators/confirm_password_input.dart';
import 'package:sparkdigital/registration/validators/email_input.dart';
import 'package:sparkdigital/registration/validators/gender_input.dart';
import 'package:sparkdigital/registration/validators/name_input.dart';
import 'package:sparkdigital/registration/validators/password_input.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final AppBloc appBloc;

  RegistrationBloc(this.appBloc) : super(const RegistrationState()) {
    on<RegistrationNameChanged>(_onRegistrationNameChanged);
    on<RegistrationBirthYearChanged>(_onRegistrationBirthYearChanged);
    on<RegistrationGenderChanged>(_onRegistrationGenderChanged);
    on<RegistrationEmailChanged>(_onRegistrationEmailChanged);
    on<RegistrationPasswordChanged>(_onRegistrationPasswordChanged);
    on<RegistrationConfirmPasswordChanged>(_onRegistrationConfirmPasswordChanged);
    on<RegistrationUserAgreementChanged>(_onRegistrationUserAgreementChanged);
    on<RegistrationSubmitted>(_onRegistrationSubmitted);
  }

  void _onRegistrationNameChanged(RegistrationNameChanged event, Emitter<RegistrationState> emit) {
    final name = NameInput.dirty(event.name);
    emit(state.copyWith(
      status: Formz.validate([name, state.birthYear, state.gender, state.email, state.password, state.confirmPassword]),
      name: name,
    ));
  }

  void _onRegistrationBirthYearChanged(RegistrationBirthYearChanged event, Emitter<RegistrationState> emit) {
    final birthYear = BirthYearInput.dirty(event.birthYear);
    emit(state.copyWith(
      status: Formz.validate([state.name, birthYear, state.gender, state.email, state.password, state.confirmPassword]),
      birthYear: birthYear,
    ));
  }

  void _onRegistrationGenderChanged(RegistrationGenderChanged event, Emitter<RegistrationState> emit) {
    final gender = GenderInput.dirty(event.gender);
    emit(state.copyWith(
      status: Formz.validate([state.name, state.birthYear, gender, state.email, state.password, state.confirmPassword]),
      gender: gender,
    ));
  }

  void _onRegistrationEmailChanged(RegistrationEmailChanged event, Emitter<RegistrationState> emit) {
    final email = EmailInput.dirty(event.email);
    emit(state.copyWith(
      status: Formz.validate([state.name, state.birthYear, state.gender, email, state.password, state.confirmPassword]),
      email: email,
    ));
  }

  void _onRegistrationPasswordChanged(RegistrationPasswordChanged event, Emitter<RegistrationState> emit) {
    final password = PasswordInput.dirty(event.password);
    emit(state.copyWith(
        status:
            Formz.validate([state.name, state.birthYear, state.gender, state.email, password, state.confirmPassword]),
        password: password));
  }

  void _onRegistrationConfirmPasswordChanged(
      RegistrationConfirmPasswordChanged event, Emitter<RegistrationState> emit) {
    final confirmPassword = ConfirmPasswordInput.dirty(event.confirmPassword, state.password);
    emit(state.copyWith(
      status: Formz.validate([state.name, state.birthYear, state.gender, state.email, state.password, confirmPassword]),
      confirmPassword: confirmPassword,
    ));
  }

  void _onRegistrationUserAgreementChanged(RegistrationUserAgreementChanged event, Emitter<RegistrationState> emit) {
    emit(state.copyWith(isUserAgreementChecked: !state.isUserAgreementChecked));
  }

  void _onRegistrationSubmitted(RegistrationSubmitted event, Emitter<RegistrationState> emit) {
    if (state.status == FormzStatus.valid && state.isUserAgreementChecked) {
      final appUser = AppUser(
        name: state.name.value!,
        birthYear: state.birthYear.value!,
        gender: state.gender.value!,
        email: state.email.value,
      );

      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      // appBloc.add(AppUserRegistered(appUser, state.password.value!));
    }
  }
}
