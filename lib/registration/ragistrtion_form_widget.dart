import 'package:flutter/material.dart';
import 'package:sparkdigital/registration/registration_birth_year_field_widget.dart';
import 'package:sparkdigital/registration/registration_confirm_password_field_widget.dart';
import 'package:sparkdigital/registration/registration_email_field_widget.dart';
import 'package:sparkdigital/registration/registration_gender_field_widget.dart';
import 'package:sparkdigital/registration/registration_name_field_widget.dart';
import 'package:sparkdigital/registration/registration_password_field_widget.dart';
import 'package:sparkdigital/registration/registration_user_agreement_widget.dart';

class RegistrationFormWidget extends StatelessWidget {
  RegistrationFormWidget({super.key});

  final _birthYearFocusNode = FocusNode();
  final _genderFocusNode = FocusNode();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          RegistrationNameFieldWidget(birthYearFocusNode: _birthYearFocusNode),
          const SizedBox(height: 16),
          RegistrationBirthYearFieldWidget(birthYearFocusNode: _birthYearFocusNode, genderFocusNode: _genderFocusNode),
          const SizedBox(height: 16),
          RegistrationGenderFieldWidget(genderFocusNode: _genderFocusNode, emailFocusNode: _emailFocusNode),
          const SizedBox(height: 16),
          RegistrationEmailFieldWidget(emailFocusNode: _emailFocusNode, passwordFocusNode: _passwordFocusNode),
          const SizedBox(height: 16),
          RegistrationPasswordFieldWidget(
            passwordFocusNode: _passwordFocusNode,
            confirmPasswordFocusNode: _confirmPasswordFocusNode,
          ),
          const SizedBox(height: 16),
          RegistrationConfirmPasswordFieldWidget(confirmPasswordFocusNode: _confirmPasswordFocusNode),
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
