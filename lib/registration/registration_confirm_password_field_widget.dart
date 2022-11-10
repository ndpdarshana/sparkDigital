import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';

class RegistrationConfirmPasswordFieldWidget extends StatelessWidget {
  const RegistrationConfirmPasswordFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
          ),
        );
      },
    );
  }
}
