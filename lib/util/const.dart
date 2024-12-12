import 'package:flutter/material.dart';

class Constants {
  static String appName = "Restaurant App";

  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red[400]!;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600]!;
  static String fontFamily = 'frank';

  static ThemeData lightTheme = ThemeData(
    fontFamily: fontFamily,
    // Apply font globally
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
      titleMedium: TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    primaryColor: lightPrimary,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      backgroundColor: lightBG,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    fontFamily: fontFamily,
    // Apply font globally
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
      titleMedium: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      labelLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    scaffoldBackgroundColor: darkBG,
    appBarTheme: AppBarTheme(
      backgroundColor: darkBG,
    ),
  );
}
