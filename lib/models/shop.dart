import 'package:flutter/material.dart';
import 'package:sushi/models/food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu = [
    Food(
        name: "Slamon Sushi",
        price: "21.00",
        imagePath: "lib/image/salmon_sushi.png",
        rating: "4.9"),
    // tuna
    Food(
        name: "Tuna",
        price: "23.00",
        imagePath: "lib/image/tuna.png",
        rating: "4.3"),
  ];
  // customer cart
  final List<Food> _cart = [];

  // getter
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;
  // add to cart
  void addToCart(Food foodItem,int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
  }
  // remove from cart
  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}