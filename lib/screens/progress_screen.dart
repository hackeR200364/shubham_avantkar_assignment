import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Progress Screen",
        style: TextStyle(
          color: Provider.of<ThemeProvider>(context).themeColors.textColor,
        ),
      ),
    );
  }
}
