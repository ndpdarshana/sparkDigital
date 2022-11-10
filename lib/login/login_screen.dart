import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/login/bloc/login_bloc.dart';
import 'package:sparkdigital/login/login_form_widget.dart';
import 'package:sparkdigital/login/login_register_now_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Log in', style: Theme.of(context).textTheme.headline1),
                LoginFormWidget(),
                TextButton(
                    onPressed: () => Navigator.of(context).pushNamed('/forgot_password'),
                    child: Text('Forgot Password')),
                LoginRegisterNowWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
