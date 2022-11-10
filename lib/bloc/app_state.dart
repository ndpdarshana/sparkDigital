part of 'app_bloc.dart';

enum AppStatus { unknown, unauthenticated, authenticated, error }

class AppState {
  final AppStatus status;

  const AppState({
    this.status = AppStatus.unknown,
  });

  AppState copyWith({AppStatus? status}) => AppState(
        status: status ?? this.status,
      );
}
