import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:sparkdigital/forgot_password/forgot_password_form_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Forgot password', style: Theme.of(context).textTheme.headline1),
                Text(
                  'Enter the email address associated with your account and we\'ll email you a link to reset your password.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
                ForgotPasswordFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
