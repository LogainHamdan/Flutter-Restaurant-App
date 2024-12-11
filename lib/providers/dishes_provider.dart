import '../util/foods.dart';
import 'package:flutter/material.dart';

class DishesProvider with ChangeNotifier {
  List<Map<String, dynamic>> _foods = [];

  // Getter
  List<Map<String, dynamic>> get foods => _foods;

  // Call this method dynamically to load the initial data
  void loadFoods() {
    _foods =
        foods; // This is done only when the provider is actively initialized.
    notifyListeners();
  }
}
