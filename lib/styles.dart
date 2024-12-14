import 'package:flutter/material.dart';

class AppColors {
  static const Color appBackgroundColor = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;
  static const Color transparent = Colors.transparent;
  static const Color fadedTextColor = Color(0xffA0AEC0);
  static const Color fadedTextColor2 = Color(0xffE3E3E3);
  static const Color notiBtnColor = Color(0xffF6F6F6);
  static const Color optionBtnColor1 = Color(0xff695CFF);
  static const Color optionBtnColor2 = Color(0xffA7A0F8);
  static const Color progressColor = Color(0xff0075FF);
  static const Color menuColor = Color(0xff484C52);
  static LinearGradient menuActiveGradient = const LinearGradient(
    colors: [
      AppColors.optionBtnColor1,
      AppColors.optionBtnColor1,
      AppColors.optionBtnColor2,
    ],
  );
  static const LinearGradient menuInActiveGradient = LinearGradient(
    colors: [
      AppColors.menuColor,
      AppColors.menuColor,
    ],
  );
  static const LinearGradient projectInActiveGradient = LinearGradient(
    colors: [
      AppColors.fadedTextColor,
      AppColors.fadedTextColor,
    ],
  );
}
