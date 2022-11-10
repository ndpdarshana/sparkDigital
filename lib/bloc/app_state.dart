part of 'app_bloc.dart';

enum AppStatus { unknown, unauthenticated, authenticated, error }

class AppState extends Equatable {
  final AppStatus status;
  final User? user;

  const AppState._({this.status = AppStatus.unknown, this.user});
  const AppState.unknown() : this._();
  const AppState.authenticated(User user) : this._(status: AppStatus.authenticated, user: user);
  const AppState.unauthenticated() : this._(status: AppStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
