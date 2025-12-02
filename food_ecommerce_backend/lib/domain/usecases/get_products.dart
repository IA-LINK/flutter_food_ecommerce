// lib/domain/usecases/get_products.dart

import 'package:food_ecommerce_backend/domain/models/product_model.dart';
import 'package:food_ecommerce_backend/data/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  List<ProductModel> execute() {
    return repository.getProducts();
  }
}
