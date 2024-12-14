import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:provider/provider.dart';

import '../models/options_model.dart';
import '../providers/options_provider.dart';
import '../providers/theme_provider.dart';
import '../styles.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget({
    super.key,
    required this.option,
    required this.themeColors,
  });

  final OptionModel option;
  final ThemeColors themeColors;

  @override
  Widget build(BuildContext context) {
    return Consumer<OptionsProvider>(builder: ((ctx, provider, child) {
      return GestureDetector(
        onTap: (() {
          provider.selectOption(option.index);
        }),
        child: Builder(
          builder: ((ctx) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              // margin: EdgeInsets.only(top: 20),
              height: 50,
              decoration: BoxDecoration(
                border: (option.index == provider.selectedOption)
                    ? Border.all(color: AppColors.transparent)
                    : GradientBoxBorder(
                        gradient: themeColors.optionBorderGradient,
                        width: 1.5,
                      ),
                borderRadius: BorderRadius.circular(16),
                gradient: (option.index == provider.selectedOption)
                    ? const LinearGradient(colors: [
                        AppColors.optionBtnColor1,
                        // .withOpacity(_animation.value),
                        AppColors.optionBtnColor2,
                        // .withOpacity(_animation.value),
                      ])
                    : null,
              ),
              child: Row(
                children: [
                  Builder(
                    builder: ((ctx) {
                      if (MediaQuery.of(context).size.width < 400) {
                        return Expanded(
                          child: OptionText(
                            head: option.head,
                            selectedOption: provider.selectedOption,
                            option: option.index,
                            textColor: themeColors.optionColor,
                          ),
                        );
                      } else {
                        return Text(
                          option.head,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.black,
                          ),
                        );
                      }
                    }),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    Icons.arrow_forward_rounded,
                    size: (option.index == provider.selectedOption) ? 18 : 22,
                    color: (option.index == provider.selectedOption)
                        ? AppColors.appBackgroundColor
                        : themeColors.textColor,
                  ),
                ],
              ),
            );
          }),
        ),
      );
    }));
  }
}

class OptionText extends StatelessWidget {
  const OptionText({
    super.key,
    required this.head,
    required this.selectedOption,
    required this.option,
    required this.textColor,
  });

  final String head;
  final int selectedOption, option;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      head,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        overflow: TextOverflow.ellipsis,
        color:
            selectedOption == option ? AppColors.appBackgroundColor : textColor,
      ),
    );
  }
}
