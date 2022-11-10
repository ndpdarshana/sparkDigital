import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/login/bloc/login_bloc.dart';

class LoginPasswrodWidget extends StatelessWidget {
  const LoginPasswrodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: state.password.invalid ? 'Password must be valid' : null,
          ),
          obscureText: true,
          onChanged: (value) => context.read<LoginBloc>().add(LoginPasswordChanged(value)),
        );
      },
    );
  }
}
