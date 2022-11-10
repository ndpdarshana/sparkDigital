import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/forgot_password/bloc/forgot_password_bloc.dart';

class ForgotPasswordIdFieldWidget extends StatelessWidget {
  const ForgotPasswordIdFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
      builder: (context, state) {
        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(labelText: 'Email'),
        );
      },
    );
  }
}
