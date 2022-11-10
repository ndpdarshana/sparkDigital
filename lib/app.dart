import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/bloc/app_bloc.dart';
import 'package:sparkdigital/login/login_screen.dart';
import 'package:sparkdigital/splash_screen.dart';

class App extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  App({super.key});

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SparkDigital',
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AppBloc, AppState>(
          listener: (context, state) {
            if (state.status == AppStatus.unknown) {
              _navigator.pushNamedAndRemoveUntil('/', (route) => false);
            } else if (state.status == AppStatus.unauthenticated) {
              _navigator.pushNamedAndRemoveUntil('/login', (route) => false);
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (settings) {
        late Widget widget;

        switch (settings.name) {
          case '/':
            widget = const SplashScreen();
            break;
          case '/login':
            widget = const LoginScreen();
            break;
        }

        return MaterialPageRoute(builder: (context) => widget, settings: settings);
      },
    );
  }
}
