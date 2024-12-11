import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  bool isFav = false;
  String _productName = "Sample Product"; // Add productName

  String get productName => _productName; // Getter to access productName

  void toggleFavorite() {
    isFav = !isFav;
    notifyListeners();
  }

  // You can add more methods to modify product details if needed
  void setProductName(String name) {
    _productName = name;
    notifyListeners();
  }
}
