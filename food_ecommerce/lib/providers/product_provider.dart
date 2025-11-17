import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../services/firebase_service.dart';

class ProductProvider with ChangeNotifier {
  final FirebaseService _service = FirebaseService();
  List<Product> _products = [];

  List<Product> get products => _products;

  // Fetch products safely
  Future<void> fetchProducts() async {
    try {
      print("Fetching products...");
      final fetchedProducts = await _service.fetchProducts();
      _products = fetchedProducts;
      print("Products loaded: ${_products.length}");
      notifyListeners();
    } catch (e) {
      print("Error fetching products: $e");
      _products = []; // Prevent null or crash
      notifyListeners();
    }
  }
}
