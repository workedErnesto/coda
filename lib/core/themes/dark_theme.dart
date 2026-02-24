import 'package:coda/core/constants/colors.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: lightTextColor,
    onPrimary: Colors.white,
    secondary: lightSecondaryColor,
    onSecondary: lightTextColor,
    error: Colors.redAccent,
    onError: Colors.white,
    surface: lightScaffoldColor,
    onSurface: lightTextColor,
  ),
  hintColor: lightTextHintColor,
  scaffoldBackgroundColor: lightScaffoldColor,
  fontFamily: 'Muller',
  useMaterial3: true,
);
