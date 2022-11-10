import 'package:flutter/material.dart';
import 'package:sparkdigital/forgot_password/forgot_password_cancel_button_widget.dart';
import 'package:sparkdigital/forgot_password/forgot_password_id_field_widget.dart';
import 'package:sparkdigital/forgot_password/fortgot_password_submit_button_widget.dart';

class ForgotPasswordFormWidget extends StatelessWidget {
  const ForgotPasswordFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: const [
          ForgotPasswordIdFieldWidget(),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ForgotPasswordSubmitButtonWidget(),
          ),
          SizedBox(
            width: double.infinity,
            child: ForgotPassworCancelButtonWidget(),
          ),
        ],
      ),
    );
  }
}
