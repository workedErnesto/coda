import 'package:coda/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: darkOnPrimaryColor,
    secondary: darkSecondaryColor,
    onSecondary: darkTextColor,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: darkScaffoldColor,
    onSurface: darkTextColor,
  ),
  hintColor: darkTextHintColor,
  scaffoldBackgroundColor: darkScaffoldColor,
  fontFamily: 'Muller',
  useMaterial3: true,
);
