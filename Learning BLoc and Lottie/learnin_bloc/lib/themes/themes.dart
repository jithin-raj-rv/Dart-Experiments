import 'package:flutter/material.dart';

class AppTheme {

    static TextTheme responsiveTextTheme(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double scale = width >= 600
        ? 1.4 // Large devices/tablets
        : width <= 350
            ? 0.85 // Very small devices
            : 1.0; // Normal phones

    return TextTheme(
      headlineLarge: TextStyle(fontSize: 25 * scale, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(fontSize: 18 * scale, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 15 * scale, fontWeight: FontWeight.bold),
      bodySmall: TextStyle(fontSize: 15 * scale, fontWeight: FontWeight.normal),
    );
  }

  static ThemeData lightTheme(BuildContext context) => ThemeData(
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      secondary: Colors.white,
      tertiary: Colors.transparent,
      outline: Colors.black
    ),
    primaryColor: Colors.black,
    brightness: Brightness.light,
    textTheme: AppTheme.responsiveTextTheme(context),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    colorScheme: ColorScheme.dark(
      primary: Colors.white,
      secondary: Colors.black,
      tertiary: Colors.transparent,
      outline: Colors.yellow
    ),
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    textTheme: AppTheme.responsiveTextTheme(context),
  );
}