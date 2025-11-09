import 'package:flutter/material.dart';
import '../models/product_model.dart';

class CartItem {
  final String id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  // A map of cart items: productId -> CartItem
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems => {..._cartItems};

  int get itemCount => _cartItems.length;

  /// Calculate total cart amount
  double get totalAmount {
    double total = 0.0;
    _cartItems.forEach((key, item) {
      total += item.price * item.quantity;
    });
    return total;
  }

  /// Add an item to the cart
  void addItem(Product product) {
    if (_cartItems.containsKey(product.id)) {
      _cartItems.update(
        product.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          price: existingItem.price,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _cartItems.putIfAbsent(
        product.id,
        () => CartItem(
          id: product.id,
          name: product.name,
          price: product.price,
        ),
      );
    }
    notifyListeners();
  }

  /// Remove a specific item
  void removeItem(String productId) {
    _cartItems.remove(productId);
    notifyListeners();
  }

  /// Clear all items in cart
  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}
