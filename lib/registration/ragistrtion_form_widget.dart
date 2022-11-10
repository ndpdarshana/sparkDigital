import 'package:flutter/material.dart';
import 'package:sparkdigital/registration/registration_birth_year_field_widget.dart';
import 'package:sparkdigital/registration/registration_confirm_password_field_widget.dart';
import 'package:sparkdigital/registration/registration_email_field_widget.dart';
import 'package:sparkdigital/registration/registration_gender_field_widget.dart';
import 'package:sparkdigital/registration/registration_name_field_widget.dart';
import 'package:sparkdigital/registration/registration_password_field_widget.dart';
import 'package:sparkdigital/registration/registration_user_agreement_widget.dart';

class RegistrationFormWidget extends StatelessWidget {
  const RegistrationFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          const RegistrationNameFieldWidget(),
          const SizedBox(height: 16),
          const RegistrationBirthYearFieldWidget(),
          const SizedBox(height: 16),
          const RegistrationGenderFieldWidget(),
          const SizedBox(height: 16),
          const RegistrationEmailFieldWidget(),
          const SizedBox(height: 16),
          const RegistrationPasswordFieldWidget(),
          const SizedBox(height: 16),
          const RegistrationConfirmPasswordFieldWidget(),
          const SizedBox(height: 16),
          const RagistrationUserAgreementWidget(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
