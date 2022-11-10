import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';

class RegistrationBirthYearFieldWidget extends StatelessWidget {
  final FocusNode birthYearFocusNode;
  final FocusNode genderFocusNode;

  const RegistrationBirthYearFieldWidget({required this.birthYearFocusNode, required this.genderFocusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.birthYear != current.birthYear,
      builder: (context, state) {
        return DropdownButtonFormField<int>(
          focusNode: birthYearFocusNode,
          onChanged: (year) {
            context.read<RegistrationBloc>().add(RegistrationBirthYearChanged(year));
            FocusScope.of(context).requestFocus(genderFocusNode);
          },
          icon: const Icon(Icons.keyboard_arrow_down_rounded),
          decoration: InputDecoration(
            labelText: 'Year of birth',
            errorText: state.birthYear.invalid ? 'Year of birth is required' : null,
          ),
          items: _generateYaersList(),
        );
      },
    );
  }

  List<DropdownMenuItem<int>> _generateYaersList() {
    DateTime currentDate = DateTime.now();

    List<DropdownMenuItem<int>> years = [];
    for (int i = 0; i < 50; i++) {
      int year = currentDate.year - i;
      years.add(DropdownMenuItem<int>(
        value: year,
        child: Text(year.toString()),
      ));
    }

    return years;
  }
}
