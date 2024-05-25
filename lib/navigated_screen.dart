import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'trendingscreen.dart';
import 'buildmynavbar.dart';

class NavigatedScreen extends StatefulWidget {
  const NavigatedScreen({super.key});

  @override
  State<NavigatedScreen> createState() => _NavigatedScreenState();
}

class _NavigatedScreenState extends State<NavigatedScreen> {
  int pageIndex = 0; // Initialize the pageIndex

  final pages = [
    HomeScreen(),
    TrendingScreen(),
    SizedBox(),
    SizedBox(),
  ];

  void updatePageIndex(int newIndex) {
    setState(() {
      pageIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BuildMyNavBar(
        currentIndex: pageIndex,
        onTap: updatePageIndex,
      ),
    );
  }
}
