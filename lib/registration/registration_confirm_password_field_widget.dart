import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';
import 'package:sparkdigital/registration/validators/confirm_password_input.dart';

class RegistrationConfirmPasswordFieldWidget extends StatelessWidget {
  final FocusNode confirmPasswordFocusNode;
  const RegistrationConfirmPasswordFieldWidget({required this.confirmPasswordFocusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.confirmPassword != current.confirmPassword,
      builder: (context, state) {
        String? errorText;
        if (state.confirmPassword.invalid) {
          switch (state.confirmPassword.error) {
            case ConfirmPasswordInputError.empty:
              errorText = 'Confirm password is required';
              break;
            case ConfirmPasswordInputError.notMatch:
              errorText = 'Passwords must be matched';
              break;
            case ConfirmPasswordInputError.invalid:
            default:
              errorText = 'Passwords must be valid';
              break;
          }
        }

        return TextFormField(
          focusNode: confirmPasswordFocusNode,
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Confirm Password', errorText: errorText),
          onChanged: (confirmPassword) =>
              context.read<RegistrationBloc>().add(RegistrationConfirmPasswordChanged(confirmPassword)),
          obscureText: true,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}
