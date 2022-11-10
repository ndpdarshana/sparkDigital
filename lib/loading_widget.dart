import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final bool visible;

  const LoadingWidget({Key? key, required this.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: visible,
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.black54),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
