import 'package:flutter/material.dart';
import 'package:sparkdigital/login/login_form_submit_button.dart';
import 'package:sparkdigital/login/login_id_field_widget.dart';
import 'package:sparkdigital/login/login_password_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: const [
          LoginIdFieldWidget(),
          SizedBox(height: 16),
          LoginPasswrodWidget(),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: LoginFormSubmitButtonWidget(),
          ),
        ],
      ),
    );
  }
}
