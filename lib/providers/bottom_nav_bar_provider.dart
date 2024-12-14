import 'package:flutter/material.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _selectedIndex = 2;

  int get selectedIndex => _selectedIndex;

  void changeIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
