import 'package:dio/dio.dart';
import '../models/product.dart';

class RemoteApi {
  final Dio _dio;
  RemoteApi(this._dio);

  Future<List<Product>> fetchProducts() async {
    final res = await _dio.get('/products');
    return (res.data as List).map((e) => Product.fromJson(e)).toList();
  }

  Future<Product> getProduct(String id) async {
    final res = await _dio.get('/products/$id');
    return Product.fromJson(res.data);
  }
}
