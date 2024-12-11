import 'package:flutter/material.dart';
import '../util/const.dart';

class ProfileProvider with ChangeNotifier {
  ThemeData _theme = Constants.lightTheme;

  ThemeData get theme => _theme;

  // Function to toggle theme between light and dark
  void toggleTheme(bool isDarkMode) {
    if (isDarkMode) {
      _theme = Constants.darkTheme;
    } else {
      _theme = Constants.lightTheme;
    }
    notifyListeners();
  }
}
