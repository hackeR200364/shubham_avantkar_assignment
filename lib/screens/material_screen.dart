import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class MaterialScreen extends StatelessWidget {
  const MaterialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Material Screen",
        style: TextStyle(
          color: Provider.of<ThemeProvider>(context).themeColors.textColor,
        ),
      ),
    );
  }
}
