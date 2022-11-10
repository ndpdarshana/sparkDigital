part of 'app_bloc.dart';

enum AppStatus { unknown, unauthenticated, registering, authenticated, error }

class AppState extends Equatable {
  final AppStatus status;
  final AppUser? user;

  const AppState._({this.status = AppStatus.unknown, this.user});
  const AppState.unknown() : this._();
  const AppState.authenticated(AppUser user) : this._(status: AppStatus.authenticated, user: user);
  const AppState.registering(AppUser user) : this._(status: AppStatus.registering, user: user);
  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);
  const AppState.error() : this._(status: AppStatus.error);

  @override
  List<Object?> get props => [status, user];
}
