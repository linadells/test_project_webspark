import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      backgroundColor: Colors.blue,
      elevation: 20,
      shadowColor: Colors.black54,
    ),
    textTheme: const TextTheme(
      displayMedium: TextStyle(
        fontSize: 18,
      ),
      displayLarge: TextStyle(
        fontSize: 25,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.black,
        textStyle: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
        side: const BorderSide(
          color: Colors.blue,
          width: 2.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    ),
  );
}
