import '../datasources/remote_api.dart';
import '../models/product.dart';

class ProductRepository {
  final RemoteApi api;
  ProductRepository(this.api);

  Future<List<Product>> getAllProducts() => api.fetchProducts();
  Future<Product> getProductById(String id) => api.getProduct(id);
}
