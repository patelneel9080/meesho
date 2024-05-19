import 'package:caferia/screens/Navigation_Pages/add_to_cart/cart_screen.dart';
import 'package:caferia/screens/Navigation_Pages/favourite_screen.dart';
import 'package:caferia/screens/Navigation_Pages/home_view/homescreen.dart';
import 'package:caferia/screens/Navigation_Pages/menuscreen.dart';
import 'package:caferia/screens/Navigation_Pages/profile_screen.dart';

import 'model/coffee_model.dart';

String userName = '';
String userEmail = '';
// List pages = [
//   HomeScreen(),
//   MenuScreen(),
//   FavouriteScreen(),
//   ProfileScreen(),
//   CartScreen(),
// ];
int pageIndex = 0;
List<Coffee> favoriteCoffees = [];

void addToFavorites(Coffee coffee) {
  favoriteCoffees.add(coffee);
}

