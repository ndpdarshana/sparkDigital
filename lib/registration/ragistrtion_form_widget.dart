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
          RegistrationNameFieldWidget(),
          RegistrationBirthYearFieldWidget(),
          RegistrationGenderFieldWidget(),
          RegistrationEmailFieldWidget(),
          RegistrationPasswordFieldWidget(),
          RegistrationConfirmPasswordFieldWidget(),
          RagistrationUserAgreementWidget(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: Text('Save'),
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
