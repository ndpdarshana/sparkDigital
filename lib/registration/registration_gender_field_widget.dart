import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/features/user/models/app_user.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';

class RegistrationGenderFieldWidget extends StatelessWidget {
  final FocusNode genderFocusNode;
  final FocusNode emailFocusNode;

  const RegistrationGenderFieldWidget({required this.genderFocusNode, required this.emailFocusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.gender != current.gender,
      builder: (context, state) {
        return DropdownButtonFormField(
          focusNode: genderFocusNode,
          onChanged: (gender) {
            context.read<RegistrationBloc>().add(RegistrationGenderChanged(gender));
            FocusScope.of(context).requestFocus(emailFocusNode);
          },
          decoration: InputDecoration(
            labelText: 'Gender',
            errorText: state.gender.invalid ? 'Gender is required' : null,
          ),
          items: const [
            DropdownMenuItem(value: Gender.male, child: Text('Male')),
            DropdownMenuItem(value: Gender.female, child: Text('Female')),
          ],
        );
      },
    );
  }
}
