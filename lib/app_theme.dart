import 'package:flutter/material.dart';

class AppThemeData {
  static ThemeData light() {
    return ThemeData(
      primaryColor: Colors.purple,
      brightness: Brightness.light,
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(48.0)),
        ),
      ),
      textTheme: TextTheme(
        headline1: ThemeData.light().textTheme.headline1!.copyWith(
              fontSize: 28,
              color: ThemeData.light().primaryColor,
            ),
      ),
    );
  }
}
