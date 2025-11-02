import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Product> _cartItems = {};

  Map<String, Product> get cartItems => _cartItems;

  void addItem(Product product) {
    _cartItems[product.id] = product;
    notifyListeners();
  }

  void removeItem(String id) {
    _cartItems.remove(id);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  double get totalAmount {
    return _cartItems.values.fold(0, (sum, item) => sum + item.price);
  }
}
