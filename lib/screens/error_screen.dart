import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Error Screen",
        style: TextStyle(
          color: Provider.of<ThemeProvider>(context).themeColors.textColor,
        ),
      ),
    );
  }
}
