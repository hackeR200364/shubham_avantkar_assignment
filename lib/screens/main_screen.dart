import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shubham_avantkar_assignment/providers/bottom_nav_bar_provider.dart';
import 'package:shubham_avantkar_assignment/providers/theme_provider.dart';
import 'package:shubham_avantkar_assignment/screens/analytics_screen.dart';
import 'package:shubham_avantkar_assignment/screens/cashflow_screen.dart';
import 'package:shubham_avantkar_assignment/screens/error_screen.dart';
import 'package:shubham_avantkar_assignment/screens/home_screen.dart';
import 'package:shubham_avantkar_assignment/screens/material_screen.dart';
import 'package:shubham_avantkar_assignment/screens/progress_screen.dart';
import 'package:shubham_avantkar_assignment/styles.dart';
import 'package:shubham_avantkar_assignment/widgets/gradient_text.dart';

import '../widgets/gradient_icon.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, (() {
      Provider.of<ThemeProvider>(context, listen: false)
          .changeTheme(MediaQuery.of(context).platformBrightness);
    }));
    return Scaffold(
      backgroundColor:
          Provider.of<ThemeProvider>(context).themeColors.appBackgroundColor,
      bottomNavigationBar: Container(
        height: 100,
        decoration: BoxDecoration(
          // color: AppColors.black,
          color: Provider.of<ThemeProvider>(context)
              .themeColors
              .appBackgroundColor,
          // borderRadius: const BorderRadius.only(
          //   topLeft: Radius.circular(25),
          //   topRight: Radius.circular(25),
          // ),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(0.5),
              spreadRadius: 3.5,
              blurRadius: 5,
              offset:
                  const Offset(0, -3), // Changed offset to -3 for shadow above
            ),
          ],
        ),
        child: Consumer<BottomNavBarProvider>(
          builder: (ctx, bottomNavBarProvider, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuWidget(
                  icon: "assets/icons/non-colored/li_home.svg",
                  head: "Home",
                  index: 0,
                  selectedIndex: bottomNavBarProvider.selectedIndex,
                  onTap: () => bottomNavBarProvider.changeIndex(0),
                ),
                MenuWidget(
                  icon: "assets/icons/non-colored/li_search.svg",
                  head: "Cash Flow",
                  index: 1,
                  selectedIndex: bottomNavBarProvider.selectedIndex,
                  onTap: () => bottomNavBarProvider.changeIndex(1),
                ),
                MenuWidget(
                  icon: "assets/icons/non-colored/li_pie-chart.svg",
                  head: "Analytics",
                  index: 2,
                  selectedIndex: bottomNavBarProvider.selectedIndex,
                  onTap: () => bottomNavBarProvider.changeIndex(2),
                ),
                MenuWidget(
                  icon: "assets/icons/non-colored/li_clock.svg",
                  head: "Progress",
                  index: 3,
                  selectedIndex: bottomNavBarProvider.selectedIndex,
                  onTap: () => bottomNavBarProvider.changeIndex(3),
                ),
                MenuWidget(
                  icon: "assets/icons/non-colored/li_raw-materials.svg",
                  head: "Material",
                  index: 4,
                  selectedIndex: bottomNavBarProvider.selectedIndex,
                  onTap: () => bottomNavBarProvider.changeIndex(4),
                ),
              ],
            );
          },
        ),
      ),
      body: Consumer<BottomNavBarProvider>(builder: ((ctx, data, child) {
        switch (data.selectedIndex) {
          case 0:
            return const HomeScreen();
          case 1:
            return const CashflowScreen();
          case 2:
            return const AnalyticsScreen();
          case 3:
            return const ProgressScreen();
          case 4:
            return const MaterialScreen();

          default:
            return const ErrorScreen();
        }
      })),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    required this.onTap,
    required this.icon,
    required this.head,
    required this.index,
    required this.selectedIndex,
  });

  final VoidCallback onTap;
  final String icon;
  final String head;
  final int index, selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientIcon(
            icon: icon,
            gradient: index == selectedIndex
                ? AppColors.menuActiveGradient
                : AppColors.menuInActiveGradient,
          ),
          const SizedBox(height: 7),
          GradientText(
            head,
            style: const TextStyle(
              color: AppColors.menuColor,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
            gradient: index == selectedIndex
                ? AppColors.menuActiveGradient
                : AppColors.menuInActiveGradient,
          ),
        ],
      ),
    );
  }
}
