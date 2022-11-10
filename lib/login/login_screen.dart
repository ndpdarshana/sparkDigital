import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/loading_widget.dart';
import 'package:sparkdigital/login/bloc/login_bloc.dart';
import 'package:sparkdigital/login/login_form_widget.dart';
import 'package:sparkdigital/login/login_register_now_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: BlocListener<LoginBloc, LoginState>(
        listenWhen: (previous, current) =>
            previous.status != current.status || previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.status == FormzStatus.submissionFailure && state.errorMessage != null) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Log in', style: Theme.of(context).textTheme.headline1),
                      const SizedBox(height: 16),
                      const LoginFormWidget(),
                      TextButton(
                          onPressed: () => Navigator.of(context).pushNamed('/forgot_password'),
                          child: const Text('Forgot Password')),
                      const LoginRegisterNowWidget(),
                    ],
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) => LoadingWidget(visible: state.status == FormzStatus.submissionInProgress),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
