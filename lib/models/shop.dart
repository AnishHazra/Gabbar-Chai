import 'package:flutter/material.dart';
import 'package:gabbar_chai/models/food.dart';

class Shop extends ChangeNotifier {
  //tea menu
  final List<Food> _foodMenu = [
    //tea
    Food(
      name: "Special Green Tea",
      price: "40",
      imagePath: "lib/images/tea2.png",
      rating: "4.5",
    ),
    Food(
      name: "Black Tea",
      price: "30",
      imagePath: "lib/images/tea3.png",
      rating: "4.8",
    ),
    Food(
      name: "Red Tea",
      price: "50",
      imagePath: "lib/images/tea4.png",
      rating: "4.8",
    ),
    Food(
      name: "Yellow Tea",
      price: "50",
      imagePath: "lib/images/tea5.png",
      rating: "4.7",
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
