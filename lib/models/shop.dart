import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';
import 'package:shop_app/theme/mode.dart';

class Shop extends ChangeNotifier {
  // product for sale
  final List<Product> _shop = [
    // prodcut 1
    Product(
        name: 'product 1',
        price: 99.0,
        description: 'description',
        imagePath: 'assets/glass.jpg'),

    // prodcut 2
    Product(
        name: 'product 2',
        price: 99.0,
        description: 'description',
        imagePath: 'assets/hoodie.jpg'),

    // prodcut 3
    Product(
        name: 'product 3',
        price: 99.0,
        description: 'description',
        imagePath: 'assets/shoes.jpg'),

    // prodcut 4
    Product(
        name: 'product 4',
        price: 99.0,
        description: 'description',
        imagePath: 'assets/watch.jpg'),
  ];

  // user cart
  List<Product> _cart = [];

  // get product list
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromItem(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  // Theme Handler: Dark mode and light mode handler

  ThemeData lightOrDarkMode = lightMode;
  IconData lightOrDarkicon = Icons.dark_mode;

  ThemeData get themeData => lightOrDarkMode;

  set themeData(ThemeData themeData) {
    lightOrDarkMode = themeData;
    notifyListeners();
  }

  void toggleLighrDarkMode() {
    if (lightOrDarkMode == lightMode) {
      themeData = darkMode;
      lightOrDarkicon = Icons.light_mode;
    } else {
      themeData = lightMode;
      lightOrDarkicon = Icons.dark_mode;
    }
  }
}
