import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  String _currentCategory = "Drinks";

  String get currentCategory => _currentCategory;

  void setCategory(String category) {
    _currentCategory = category;
    notifyListeners();
  }
}
