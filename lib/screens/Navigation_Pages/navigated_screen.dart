import 'package:caferia/screens/Navigation_Pages/cart_screen.dart';
import 'package:caferia/screens/Navigation_Pages/favourite_screen.dart';
import 'package:caferia/screens/Navigation_Pages/homescreen.dart';
import 'package:caferia/screens/Navigation_Pages/menuscreen.dart';
import 'package:caferia/screens/Navigation_Pages/profile_screen.dart';
import 'package:flutter/material.dart';

class Navigated_Screen extends StatefulWidget {
  const Navigated_Screen({super.key});

  @override
  State<Navigated_Screen> createState() => _Navigated_ScreenState();
}

class _Navigated_ScreenState extends State<Navigated_Screen> {

  int activeindex = 0;
  final List<Widget> _pages =[
    HomeScreen(),
    MenuScreen(),
    FavouriteScreen(),
    ProfileScreen(),
    CartScreen(),
  ];

  Widget showScreens(int index){
    return _pages[index];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: showScreens(activeindex),
      bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(Icons.home,color: Color(0xffE65836)),
              icon: Icon(Icons.home_outlined,color: Colors.grey,),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.menu_book,color: Color(0xffE65836)),
              icon: Icon(Icons.menu_book_outlined,color: Colors.grey,),
              label: 'Menu',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.favorite,color: Color(0xffE65836)),
              icon: Icon(Icons.favorite_outline,color: Colors.grey,),
              label: 'Favourites',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.person,color: Color(0xffE65836)),
              icon: Icon(Icons.person_outline,color: Colors.grey,),
              label: 'Profile',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.shopping_cart,color: Color(0xffE65836)),
              icon: Icon(Icons.shopping_cart_outlined,color: Colors.grey,),
              label: 'Cart',
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              activeindex = index;
            });
          },
          indicatorColor: Colors.transparent,
          height: size.height/14,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          elevation: 1,
          backgroundColor: Colors.white,
          selectedIndex: activeindex),
    );
  }
}