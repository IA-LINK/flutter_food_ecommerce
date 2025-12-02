// lib/data/repositories/product_repository.dart

import 'package:food_ecommerce_backend/data/datasources/product_local_data.dart';
import 'package:food_ecommerce_backend/domain/models/product_model.dart';

class ProductRepository {
  List<ProductModel> getProducts() {
    return ProductLocalData.products;
  }

  ProductModel? getProductById(String id) {
    try {
      return ProductLocalData.products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
