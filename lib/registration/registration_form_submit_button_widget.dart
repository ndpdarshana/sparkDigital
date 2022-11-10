import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';

class RegistrationFormSubmitButtonWidget extends StatelessWidget {
  const RegistrationFormSubmitButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) =>
          previous.status != current.status || previous.isUserAgreementChecked != current.isUserAgreementChecked,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: state.status == FormzStatus.valid && state.isUserAgreementChecked
              ? () => context.read<RegistrationBloc>().add(RegistrationSubmitted())
              : null,
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          child: const Text('Save'),
        );
      },
    );
  }
}
