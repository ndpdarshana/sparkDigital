part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppLoaded extends AppEvent {
  const AppLoaded();

  @override
  List<Object> get props => [];
}

class AppStatusChanged extends AppEvent {
  final User? user;

  const AppStatusChanged(this.user);

  @override
  List<Object?> get props => [user];
}

class AppSignoutRequested extends AppEvent {
  const AppSignoutRequested();

  @override
  List<Object?> get props => [];
}
