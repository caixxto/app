import 'package:app/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get buttonOnTheme {
    return ThemeData(
      buttonTheme: const ButtonThemeData(
        buttonColor: CustomColors.yellow,
      )
    );
  }
}