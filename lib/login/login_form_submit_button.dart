import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/login/bloc/login_bloc.dart';

class LoginFormSubmitButtonWidget extends StatelessWidget {
  const LoginFormSubmitButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed:
              state.status == FormzStatus.valid ? () => context.read<LoginBloc>().add(LoginFormSubmitted()) : null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: const Text('Let\'s go'),
        );
      },
    );
  }
}
