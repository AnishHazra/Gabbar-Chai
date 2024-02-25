import 'package:flutter/material.dart';
import 'package:gabbar_chai/models/food.dart';

class Shop extends ChangeNotifier {
  //food menu
  final List<Food> _foodMenu = [
    //sandwich
    Food(
      name: "Veg Cheese Grill",
      price: "120",
      imagePath: "lib/images/sandwich1.png",
      rating: "4.5",
    ),
    Food(
      name: "Chilli Cheese",
      price: "120",
      imagePath: "lib/images/sandwich2.png",
      rating: "4.5",
    ),
    Food(
      name: "Chicken Tikka",
      price: "150",
      imagePath: "lib/images/sandwich3.png",
      rating: "4.8",
    ),
  ];

  // customer cart

  final List<Food> _cart = [];

  // getter methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  //remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
