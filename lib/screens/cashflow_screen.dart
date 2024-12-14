import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/theme_provider.dart';

class CashflowScreen extends StatelessWidget {
  const CashflowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Cashflow Screen",
        style: TextStyle(
          color: Provider.of<ThemeProvider>(context).themeColors.textColor,
        ),
      ),
    );
  }
}
