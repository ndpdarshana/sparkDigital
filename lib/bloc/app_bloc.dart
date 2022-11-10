import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sparkdigital/features/auth/auth_repository.dart';
import 'package:sparkdigital/features/user/models/app_user.dart';
import 'package:sparkdigital/features/user/user_repositry.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  final UserRepository _userRepository;
  late StreamSubscription<User?> _streamSubscription;

  AppBloc()
      : _authRepository = AuthRepository(),
        _userRepository = UserRepository(),
        super(const AppState.unknown()) {
    on<AppStatusChanged>(_onAppStatusChanged);
    on<AppUserRegistered>(_onAppUserRegistered);
    on<AppSignoutRequested>(_onAppSignoutRequested);
    _streamSubscription = _authRepository.user.listen((user) {
      print('test');
      add(AppStatusChanged(user));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    _authRepository.dispose();
    return super.close();
  }

  void _onAppStatusChanged(AppStatusChanged event, Emitter<AppState> emit) async {
    if (event.user != null) {
      try {
        if (state.status == AppStatus.registering) {
          AppUser appUser = state.user!.copyWith(id: event.user!.uid);
          await _userRepository.createUser(appUser);
          emit(AppState.authenticated(appUser));
        } else {
          final appUser = await _userRepository.getUser(event.user!.uid);
          emit(AppState.authenticated(appUser));
        }
      } catch (e) {
        emit(const AppState.error());
      }
    } else {
      emit(const AppState.unauthenticated());
    }
  }

  void _onAppUserRegistered(AppUserRegistered event, Emitter<AppState> emit) async {
    emit(AppState.registering(event.user));
    unawaited(_authRepository.signup(email: event.user.email, password: event.password));
  }

  void _onAppSignoutRequested(AppSignoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.signout());
  }
}
