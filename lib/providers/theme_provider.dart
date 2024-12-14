import 'package:flutter/material.dart';

import '../styles.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;

  // Constructor accepting theme mode and initializing colors accordingly
  ThemeColors _themeColors;

  ThemeProvider() : _themeColors = ThemeColors.light(); // default to light mode

  // Getter for the theme colors
  ThemeColors get themeColors => _themeColors;

  // Function to toggle the theme mode
  void changeTheme(Brightness brightness) {
    // isDarkMode = !isDarkMode;
    _themeColors = brightness == Brightness.dark
        ? ThemeColors.dark()
        : ThemeColors.light();
    notifyListeners(); // Notify listeners when theme changes
  }
}

class ThemeColors {
  // Define the color variables
  final Color appBackgroundColor, optionColor;
  final Color textColor;
  final Color buttonColor;
  final LinearGradient optionBorderGradient;

  // Constructor that initializes colors based on the mode
  const ThemeColors._({
    required this.appBackgroundColor,
    required this.textColor,
    required this.buttonColor,
    required this.optionColor,
    required this.optionBorderGradient,
  });

  // Static method for light theme colors
  static ThemeColors light() {
    return const ThemeColors._(
      appBackgroundColor: Colors.white,
      textColor: Colors.black,
      buttonColor: Colors.blue,
      optionColor: Colors.black,
      optionBorderGradient: LinearGradient(
        colors: [
          AppColors.optionBtnColor1,
          AppColors.optionBtnColor2,
        ],
      ),
    );
  }

  // Static method for dark theme colors
  static ThemeColors dark() {
    return const ThemeColors._(
      appBackgroundColor: Color(0xff111029),
      textColor: Colors.white,
      buttonColor: Colors.green,
      optionColor: Colors.white,
      optionBorderGradient: LinearGradient(
        colors: [
          Color(0xff8692A6),
          Color(0xff343840),
        ],
      ),
    );
  }
}
