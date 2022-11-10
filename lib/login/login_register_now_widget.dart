import 'package:flutter/material.dart';

class LoginRegisterNowWidget extends StatelessWidget {
  const LoginRegisterNowWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Don\'t have an account? Register now!'),
      SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil('/register', (route) => false),
          child: Text('Register'),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
        ),
      ),
    ]);
  }
}
