import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/features/user/models/app_user.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';

class RegistrationGenderFieldWidget extends StatelessWidget {
  const RegistrationGenderFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return DropdownButtonFormField(
          onChanged: (value) {},
          decoration: const InputDecoration(labelText: 'Gender'),
          items: const [
            DropdownMenuItem(value: Gender.male, child: Text('Male')),
            DropdownMenuItem(value: Gender.female, child: Text('Female')),
          ],
        );
      },
    );
  }
}
