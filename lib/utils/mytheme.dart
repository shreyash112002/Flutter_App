import 'package:flutter/material.dart';


class MyTheme{
  static const splash = Color(0xFFE81667);
  static const appBarColor = Color(0xFF222539);

  static final myDarkTheme = ThemeData(
    primaryColor: splash,
    scaffoldBackgroundColor: appBarColor,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    backgroundColor: appBarColor,
    buttonTheme: const ButtonThemeData(
      colorScheme: ColorScheme.dark(
        background: splash,
        primary: splash,
      ),
    ),
    appBarTheme: const AppBarTheme(
      color: appBarColor,
    ),
  );
}