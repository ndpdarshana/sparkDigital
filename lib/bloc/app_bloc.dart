import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppLoaded>(_onAppLoaded);
  }

  void _onAppLoaded(AppLoaded event, Emitter<AppState> emit) {
    emit(state.copyWith(status: AppStatus.unauthenticated));
  }
}
