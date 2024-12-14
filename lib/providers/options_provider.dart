import 'package:flutter/material.dart';

class OptionsProvider extends ChangeNotifier {
  int _selectedOption = 0;

  int get selectedOption => _selectedOption;

  void selectOption(int newOption) {
    _selectedOption = newOption;
    notifyListeners();
  }
}
