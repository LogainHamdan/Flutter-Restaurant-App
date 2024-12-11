import 'package:flutter/material.dart';
class Constants{

  static String appName = "Restaurant App UI KIT";

  //Colors for theme
//  Color(0xfffcfcff);
  static Color lightPrimary = Color(0xfffcfcff);
  static Color darkPrimary = Colors.black;
  static Color lightAccent = Colors.red;
  static Color darkAccent = Colors.red[400]!;
  static Color lightBG = Color(0xfffcfcff);
  static Color darkBG = Colors.black;
  static Color ratingBG = Colors.yellow[600]!;

  static ThemeData lightTheme = ThemeData(

    textTheme: TextTheme(
      titleMedium:TextStyle(
        color: darkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ) ,
    ),
    // backgroundColor: lightBG,
    primaryColor: lightPrimary,
    // accentColor:  lightAccent,
    // cursorColor: lightAccent,
    scaffoldBackgroundColor: lightBG,
    appBarTheme: AppBarTheme(
      backgroundColor: lightBG,
//      iconTheme: IconThemeData(
//        color: lightAccent,
//      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      titleMedium: TextStyle(
        color: lightBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
    ),
    brightness: Brightness.dark,
    primaryColor: darkPrimary,
    // accentColor: darkAccent,
    scaffoldBackgroundColor: darkBG,
    // cursorColor: darkAccent,
    appBarTheme: AppBarTheme(
      backgroundColor: darkBG,
//      iconTheme: IconThemeData(
//        color: darkAccent,
//      ),
    ),
  );


}