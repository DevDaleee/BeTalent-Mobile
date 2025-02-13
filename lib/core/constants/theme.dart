import 'package:flutter/material.dart';

class AppTheme {
  static const Color bluePrimary = Color(0xFF0029FF);
  static const Color blue10 = Color(0xFFE5E9FF);
  static const Color blackNeutral = Color(0xFF1C1C1C);
  static const Color gray20 = Color(0xFFB2B2B2);
  static const Color gray10 = Color(0xFFE5E5E5);
  static const Color gray05 = Color(0xFFF2F2F2);
  static const Color gray00 = Color(0xFFFAFAFA);
  static const Color whiteNeutral = Color(0xFFFFFFFF);

  static ThemeData lightTheme = ThemeData(
    fontFamily: 'Helvica',
    brightness: Brightness.light,
    primaryColor: bluePrimary,
    scaffoldBackgroundColor: whiteNeutral,
    appBarTheme: AppBarTheme(
      backgroundColor: whiteNeutral,
      elevation: 0,
      iconTheme: IconThemeData(color: blackNeutral),
      titleTextStyle: TextStyle(
        color: blackNeutral,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: bluePrimary,
      secondary: blue10,
      surface: gray05,
      onPrimary: whiteNeutral,
      onSecondary: blackNeutral,
      onSurface: blackNeutral,
      onError: whiteNeutral,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: blackNeutral),
      bodyMedium: TextStyle(color: gray20),
      bodySmall: TextStyle(color: gray10),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: bluePrimary,
      textTheme: ButtonTextTheme.primary,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: 'Helvica',
    brightness: Brightness.dark,
    primaryColor: bluePrimary,
    scaffoldBackgroundColor: blackNeutral,
    appBarTheme: AppBarTheme(
      backgroundColor: blackNeutral,
      elevation: 0,
      iconTheme: IconThemeData(color: whiteNeutral),
      titleTextStyle: TextStyle(
        color: whiteNeutral,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    colorScheme: ColorScheme.dark(
      primary: bluePrimary,
      secondary: blue10,
      surface: gray10,
      onPrimary: whiteNeutral,
      onSecondary: blackNeutral,
      onSurface: whiteNeutral,
      onError: blackNeutral,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: whiteNeutral),
      bodyMedium: TextStyle(color: gray10),
      bodySmall: TextStyle(color: gray20),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: bluePrimary,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}
