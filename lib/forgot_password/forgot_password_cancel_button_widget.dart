import 'package:flutter/material.dart';

class ForgotPassworCancelButtonWidget extends StatelessWidget {
  const ForgotPassworCancelButtonWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).pop(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      child: const Text('Cancel'),
    );
  }
}
