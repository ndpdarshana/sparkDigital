import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/login/bloc/login_bloc.dart';

class LoginIdFieldWidget extends StatelessWidget {
  const LoginIdFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration:
              InputDecoration(labelText: 'Email', errorText: state.email.invalid ? 'Email must be valid' : null),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
          onChanged: (value) => context.read<LoginBloc>().add(LoginIdChanged(value)),
        );
      },
    );
  }
}
