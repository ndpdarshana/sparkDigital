import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sparkdigital/registration/bloc/registration_bloc.dart';

class RagistrationUserAgreementWidget extends StatelessWidget {
  const RagistrationUserAgreementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (previous, current) => previous.isUserAgreementChecked != current.isUserAgreementChecked,
      builder: (context, state) {
        return Row(
          children: [
            Checkbox(
                value: state.isUserAgreementChecked,
                onChanged: (_) => context.read<RegistrationBloc>().add(RegistrationUserAgreementChanged())),
            const Expanded(
              child: Text(
                'I have read the Terms of Use and Privacy Policy and I want to proceed.',
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        );
      },
    );
  }
}
