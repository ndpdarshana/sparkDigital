import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sparkdigital/features/auth/auth_repository.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthRepository _authRepository;
  late StreamSubscription<User?> _streamSubscription;

  AppBloc()
      : _authRepository = AuthRepository(),
        super(const AppState.unknown()) {
    on<AppLoaded>(_onAppLoaded);
    on<AppStatusChanged>(_onAppStatusChanged);
    on<AppSignoutRequested>(_onAppSignoutRequested);
    _streamSubscription = _authRepository.user.listen((user) {
      add(AppStatusChanged(user));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    _authRepository.dispose();
    return super.close();
  }

  void _onAppLoaded(AppLoaded event, Emitter<AppState> emit) {
    emit(AppState.unauthenticated());
  }

  void _onAppStatusChanged(AppStatusChanged event, Emitter<AppState> emit) {
    if (event.user != null) {
      emit(AppState.authenticated(event.user!));
    } else {
      emit(const AppState.unauthenticated());
    }
  }

  void _onAppSignoutRequested(AppSignoutRequested event, Emitter<AppState> emit) {
    unawaited(_authRepository.signout());
  }
}
