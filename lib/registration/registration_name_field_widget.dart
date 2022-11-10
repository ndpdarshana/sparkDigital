import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';
import 'package:sparkdigital/registration/validators/name_input.dart';

class RegistrationNameFieldWidget extends StatelessWidget {
  final FocusNode birthYearFocusNode;
  const RegistrationNameFieldWidget({required this.birthYearFocusNode, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        String? errorText;
        if (state.name.invalid) {
          if (state.name.error == NameInputError.empty) {
            errorText = 'Name can not be empty';
          } else {
            errorText = 'Name must be valid';
          }
        }

        return TextFormField(
          autocorrect: false,
          decoration: InputDecoration(
            counterStyle: const TextStyle(height: 0),
            counterText: '',
            labelText: 'Name',
            errorText: errorText,
          ),
          maxLength: 50,
          enableSuggestions: false,
          onChanged: (name) => context.read<RegistrationBloc>().add(RegistrationNameChanged(name)),
          keyboardType: TextInputType.name,
          textInputAction: TextInputAction.next,
          onFieldSubmitted: (_) => FocusScope.of(context).requestFocus(birthYearFocusNode),
        );
      },
    );
  }
}
