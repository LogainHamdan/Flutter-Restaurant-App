import 'package:flutter/material.dart';
import '../util/foods.dart';

class CartProvider with ChangeNotifier {
  List<Map<String, dynamic>> _cartItems = List.from(foods);

  List<Map<String, dynamic>> get cartItems => _cartItems;

  void addItem(Map<String, dynamic> item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
}
