import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';
import 'package:sparkdigital/registration/validators/email_input.dart';

class RegistrationEmailFieldWidget extends StatelessWidget {
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;
  const RegistrationEmailFieldWidget({required this.emailFocusNode, required this.passwordFocusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        String? errorText;
        if (state.email.invalid) {
          if (state.email.error == EmailInputError.empty) {
            errorText = 'Email is required';
          } else {
            errorText = 'Email must be valid';
          }
        }

        return TextFormField(
          autocorrect: false,
          focusNode: emailFocusNode,
          decoration: InputDecoration(
            labelText: 'Email',
            errorText: errorText,
          ),
          onChanged: (email) => context.read<RegistrationBloc>().add(RegistrationEmailChanged(email)),
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(passwordFocusNode),
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
