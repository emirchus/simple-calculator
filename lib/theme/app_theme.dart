import 'package:flutter/material.dart';
import 'package:simple_calculator/theme/colors.dart';

final lightTheme = ThemeData(
  useMaterial3: true,
  backgroundColor: kLightBackground,
  primaryColor: kLightPrimary,
  scaffoldBackgroundColor: kLightBackground,
  colorScheme: const ColorScheme.light(
    primary: kLightPrimary,
    secondary: kLightBackground,
    background: kLightBackground,
    brightness: Brightness.light,
    inversePrimary: kDarkPrimary,
  ),
);

final darkTheme = ThemeData(
  brightness: Brightness.dark,
  useMaterial3: true,
  backgroundColor: kDarkBackground,
  primaryColor: kDarkPrimary,
  scaffoldBackgroundColor: kDarkBackground,
  colorScheme: const ColorScheme.dark(
    primary: kDarkPrimary,
    secondary: kDarkBackground,
    background: kDarkBackground,
    inversePrimary: kLightPrimary,
  ),
);
