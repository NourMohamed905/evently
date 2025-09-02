import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color(0xFF5669FF);
  static const Color backgroundColorLight = Color(0xFFF2FEFF);
  static const Color backgroundColorDarck = Color(0xFF101127);
  static const Color grey = Color(0xFF7B7B7B);
  static const Color white = Color(0xFFF2FEFF);
  static const Color black = Color(0xFF1C1C1C);
  static const Color red = Color(0xFFFF5659);

  static ThemeData lightTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: white,
      unselectedItemColor: white,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      bodyMedium: TextStyle(color: black, fontSize: 16),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: white,
      shape: CircleBorder(side: BorderSide(color: white, width: 0)),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: primaryColor,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: white,
      unselectedItemColor: white,
    ),
  );
}
