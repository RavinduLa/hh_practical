import 'package:flutter/material.dart';
import 'package:sample_project_hh/screens/bookings.dart';
import 'package:sample_project_hh/screens/find.dart';
import 'package:sample_project_hh/screens/menu.dart';
import 'package:sample_project_hh/screens/saved.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  //initialize index for tha pages/screens
  int currentIndex = 0;

  //array of screens
  final screens = [const Find(), const Bookings(), const Saved(), const Menu()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded), label: 'Find'),
          BottomNavigationBarItem(
              icon: Icon(Icons.cases_outlined), label: 'Bookings'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border_outlined), label: 'Saved'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Menu'),
        ],
      ),
    );
  }
}
