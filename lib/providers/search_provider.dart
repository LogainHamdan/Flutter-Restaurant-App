import 'package:flutter/material.dart';
import '../util/foods.dart';

class SearchProvider with ChangeNotifier {
  String _searchText = "";
  List<Map<String, dynamic>> _searchHistory = [];

  String get searchText => _searchText;
  List<Map<String, dynamic>> get searchHistory => _searchHistory;

  void setSearchText(String value) {
    _searchText = value;
    notifyListeners();
  }

  void addToSearchHistory(String query) {
    if (query.isNotEmpty &&
        !_searchHistory.any((item) => item['name'] == query)) {
      _searchHistory
          .insert(0, {"name": query, "img": "assets/images/default_food.png"});
      notifyListeners();
    }
  }
}
