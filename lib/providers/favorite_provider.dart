import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  List<Map<String, dynamic>> _foods = [
    {
      "img": "assets/images/food1.png",
      "name": "Pizza",
    },
    {
      "img": "assets/images/food2.png",
      "name": "Burger",
    },
    {
      "img": "assets/images/food3.png",
      "name": "Pasta",
    },
  ];

  List<Map<String, dynamic>> get foods => _foods;

  void addFavorite(Map<String, dynamic> food) {
    _foods.add(food);
    notifyListeners();
  }

  void removeFavorite(int index) {
    _foods.removeAt(index);
    notifyListeners();
  }
}
