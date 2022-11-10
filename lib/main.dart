import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/bloc/app_bloc.dart';

import 'app.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => AppBloc()..add(const AppLoaded()),
    child: App(),
  ));
}
