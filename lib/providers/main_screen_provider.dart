import 'package:flutter/material.dart';

class MainScreenController extends ChangeNotifier {
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  PageController get pageController => _pageController;
  int get currentPageIndex => _currentPageIndex;

  void setPage(int index) {
    _currentPageIndex = index;
    _pageController.jumpToPage(index);
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
