import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold), // Au lieu de bodyText1
      bodyMedium: TextStyle(fontSize: 14), // Au lieu de bodyText2
    ),
  );
}
