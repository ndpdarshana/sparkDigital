import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/features/user/models/app_user.dart';
import 'package:sparkdigital/registration/validators/birth_year_input.dart';
import 'package:sparkdigital/registration/validators/confirm_password_input.dart';
import 'package:sparkdigital/registration/validators/email_input.dart';
import 'package:sparkdigital/registration/validators/name_input.dart';
import 'package:sparkdigital/registration/validators/password_input.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState()) {
    on<RegistrationNameChanged>(_onRegistrationNameChanged);
    on<RegistrationBirthYearChanged>(_onRegistrationBirthYearChanged);
    on<RegistrationGenderChanged>(_onRegistrationGenderChanged);
    on<RegistrationEmailChanged>(_onRegistrationEmailChanged);
    on<RegistrationPasswordChanged>(_onRegistrationPasswordChanged);
    on<RegistrationConfirmPasswordChanged>(_onRegistrationConfirmPasswordChanged);
  }

  void _onRegistrationNameChanged(RegistrationNameChanged event, Emitter<RegistrationState> emit) {}

  void _onRegistrationBirthYearChanged(RegistrationBirthYearChanged event, Emitter<RegistrationState> emit) {}

  void _onRegistrationGenderChanged(RegistrationGenderChanged event, Emitter<RegistrationState> emit) {}

  void _onRegistrationEmailChanged(RegistrationEmailChanged event, Emitter<RegistrationState> emit) {}

  void _onRegistrationPasswordChanged(RegistrationPasswordChanged event, Emitter<RegistrationState> emit) {}

  void _onRegistrationConfirmPasswordChanged(
      RegistrationConfirmPasswordChanged event, Emitter<RegistrationState> emit) {}
}
