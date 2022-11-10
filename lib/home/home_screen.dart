import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/bloc/app_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(children: [
            Text('Welcome!', style: Theme.of(context).textTheme.headline1),
            ElevatedButton(
              onPressed: (() => context.read<AppBloc>().add(const AppSignoutRequested())),
              child: const Text('Log out'),
            )
          ]),
        ),
      ),
    );
  }
}
