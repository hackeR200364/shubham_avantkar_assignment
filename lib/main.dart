import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shubham_avantkar_assignment/providers/bottom_nav_bar_provider.dart';
import 'package:shubham_avantkar_assignment/providers/options_provider.dart';
import 'package:shubham_avantkar_assignment/providers/projects_provider.dart';
import 'package:shubham_avantkar_assignment/providers/theme_provider.dart';
import 'package:shubham_avantkar_assignment/screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BottomNavBarProvider()),
        ChangeNotifierProvider(create: (_) => ProjectsProvider()),
        ChangeNotifierProvider(create: (_) => OptionsProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // log(MediaQuery.of(context).platformBrightness.toString());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const MainScreen(),
    );
  }
}
