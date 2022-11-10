import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';

class RegistrationBirthYearFieldWidget extends StatelessWidget {
  const RegistrationBirthYearFieldWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      builder: (context, state) {
        return DropdownButtonFormField(
          onChanged: (value) {},
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          decoration: const InputDecoration(labelText: 'Year of birth'),
          items: _generateYaersList(),
        );
      },
    );
  }

  List<DropdownMenuItem> _generateYaersList() {
    DateTime currentDate = DateTime.now();

    List<DropdownMenuItem> years = [];
    for (int i = 0; i < 50; i++) {
      int year = currentDate.year - i;
      years.add(DropdownMenuItem(
        value: year,
        child: Text(year.toString()),
      ));
    }

    return years;
  }
}
