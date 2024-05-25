import 'package:caferia/screens/Navigation_Pages/add_to_cart/cart_screen.dart';
import 'package:caferia/screens/Navigation_Pages/favourite_screen.dart';
import 'package:caferia/screens/Navigation_Pages/home_view/homescreen.dart';
import 'package:caferia/screens/Navigation_Pages/menuscreen.dart';
import 'package:caferia/screens/Navigation_Pages/profile_screen.dart';
import 'package:flutter/material.dart';

import 'build_nav.dart';
import 'const.dart';
import 'mynav_bar.dart';

class NavigatedScreen extends StatefulWidget {
  const NavigatedScreen({super.key});

  @override
  State<NavigatedScreen> createState() => _NavigatedScreenState();
}

class _NavigatedScreenState extends State<NavigatedScreen> {
  List pages = [
    HomeScreen(),
    MenuScreen(),
    FavouriteScreen(),
    ProfileScreen(),
    CartScreen(),
  ];
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BuildMyNavBar(pageIndex: activeIndex, onTap: (int value) {  },),
    );
  }
}
