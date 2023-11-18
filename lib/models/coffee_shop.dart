import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'coffee.dart';
class CoffeeShop extends ChangeNotifier {
  List<Coffee> _coffeeShop = [];
  List<Coffee> _userCart = [];

  List<Coffee> get coffeeShop => _coffeeShop;
  List<Coffee> get userCart => _userCart;

  Future<void> loadCoffeeData() async {
  try {
    final String response = await rootBundle.loadString('lib/models/data.json');
    if (response != null && response.isNotEmpty) {
      final List<dynamic> data = json.decode(response);
      _coffeeShop = data.map((json) => Coffee.fromJson(json)).toList();
      notifyListeners();
    }
  } catch (error) {
    print('Error loading data: $error');
    throw error;
  }
}
  void addItemToCart(Coffee coffee) {
    _userCart.add(coffee);
    notifyListeners();
  }

  void removeItemFromCart(Coffee coffee) {
    _userCart.remove(coffee);
    notifyListeners();
  }

  double calculateTotalPrice() {
    double totalPrice = 0;

    for (Coffee coffee in userCart) {
      totalPrice += coffee.price * coffee.quantity;
    }

    return totalPrice;
  }
}
