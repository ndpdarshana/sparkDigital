import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/forgot_password/bloc/forgot_password_bloc.dart';

class ForgotPasswordSubmitButtonWidget extends StatelessWidget {
  const ForgotPasswordSubmitButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status == FormzStatus.valid
              ? () => context.read<ForgotPasswordBloc>().add(ForgotPasswordFormSubmitted())
              : null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: const Text('Continue'),
        );
      },
    );
  }
}
