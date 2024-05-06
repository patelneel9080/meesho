import 'package:caferia/model/coffee_model.dart';
import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
  List<Coffee> _cartItems = [];

  List<Coffee> get cartItems => _cartItems;

  void addToCart(Coffee item) {
    _cartItems.add(item);
    notifyListeners();
  }
  void removeCartItem(Coffee cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }

  void updateCart() {
    notifyListeners();
  }
}
