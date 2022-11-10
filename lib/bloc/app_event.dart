part of 'app_bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();
}

class AppLoaded extends AppEvent {
  const AppLoaded();

  @override
  List<Object> get props => [];
}
