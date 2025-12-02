// lib/data/datasources/product_local_data.dart

import 'package:food_ecommerce_backend/domain/models/product_model.dart';

class ProductLocalData {
  static List<ProductModel> products = [
    ProductModel(
      id: '1',
      title: 'Chicken Burger',
      description: 'Delicious grilled chicken burger with vegetables.',
      imageUrl: 'https://via.placeholder.com/400x300',
      price: 9.99,
    ),
    ProductModel(
      id: '2',
      title: 'Beef Pizza',
      description: 'Hot beef pizza with cheese topping.',
      imageUrl: 'https://via.placeholder.com/400x300',
      price: 14.99,
    ),
    ProductModel(
      id: '3',
      title: 'Chocolate Cake',
      description: 'Fresh chocolate layered cake.',
      imageUrl: 'https://via.placeholder.com/400x300',
      price: 6.49,
    ),
  ];
}
