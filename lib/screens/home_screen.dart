import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Home Screen",
        style: TextStyle(
          color: Provider.of<ThemeProvider>(context).themeColors.textColor,
        ),
      ),
    );
  }
}
