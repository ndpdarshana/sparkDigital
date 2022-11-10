import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';
import 'package:sparkdigital/registration/validators/email_input.dart';

class RegistrationPasswordFieldWidget extends StatelessWidget {
  final FocusNode passwordFocusNode;
  final FocusNode confirmPasswordFocusNode;
  const RegistrationPasswordFieldWidget(
      {required this.passwordFocusNode, required this.confirmPasswordFocusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        String? errorText;
        if (state.password.invalid) {
          if (state.password.error == EmailInputError.empty) {
            errorText = 'Password is required';
          } else {
            errorText = 'Password must be valid';
          }
        }

        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: errorText,
          ),
          onChanged: (password) => context.read<RegistrationBloc>().add(RegistrationPasswordChanged(password)),
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(confirmPasswordFocusNode),
          focusNode: passwordFocusNode,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
