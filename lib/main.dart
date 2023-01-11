import 'package:flutter/material.dart';
import 'package:sample_project_hh/screens/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //temporary material color for primary swatch
  final MaterialColor primarySwatchColor = const MaterialColor(
    0xFFB086BA,
    <int, Color>{
      50: Color(0xFFB086BA),
      100: Color(0xFFB086BA),
      200: Color(0xFFB086BA),
      300: Color(0xFFB086BA),
      400: Color(0xFFB086BA),
      500: Color(0xFFB086BA),
      600: Color(0xFFB086BA),
      700: Color(0xFFB086BA),
      800: Color(0xFFB086BA),
      900: Color(0xFFB086BA),
    },
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hippo Sample',
      theme: ThemeData(
        primarySwatch: primarySwatchColor,
      ),
      home: const LandingPage(),
    );
  }
}
