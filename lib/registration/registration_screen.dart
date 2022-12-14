import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/loading_widget.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';
import 'package:sparkdigital/registration/ragistrtion_form_widget.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: BlocListener<RegistrationBloc, RegistrationState>(
        listener: (context, state) {
          if (state.status == FormzStatus.submissionFailure && state.errorMessage != null) {
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 32, left: 16, right: 16, bottom: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Let\' Begin', style: Theme.of(context).textTheme.headline1),
                        const SizedBox(height: 16),
                        RegistrationFormWidget(),
                        Row(
                          children: [
                            const Text('Already have a profile?'),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('Login'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (_, state) {
                    return LoadingWidget(visible: state.status == FormzStatus.submissionInProgress);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
