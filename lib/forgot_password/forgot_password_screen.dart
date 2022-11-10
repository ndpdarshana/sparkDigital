import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:sparkdigital/forgot_password/forgot_password_form_widget.dart';
import 'package:sparkdigital/loading_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordBloc(),
      child: BlocListener<ForgotPasswordBloc, ForgotPasswordState>(
        listenWhen: (previous, current) =>
            previous.status != current.status || previous.errorMessage != current.errorMessage,
        listener: (context, state) {
          if (state.status == FormzStatus.submissionFailure && state.errorMessage != null) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          } else if (state.status == FormzStatus.submissionSuccess) {
            Navigator.of(context).pop();
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Forgot password', style: Theme.of(context).textTheme.headline1),
                      const SizedBox(height: 16),
                      const Text(
                        'Enter the email address associated with your account and we\'ll email you a link to reset your password.',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 16),
                      const ForgotPasswordFormWidget(),
                    ],
                  ),
                ),
              ),
              BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
                builder: (context, state) {
                  return LoadingWidget(visible: state.status == FormzStatus.submissionInProgress);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
