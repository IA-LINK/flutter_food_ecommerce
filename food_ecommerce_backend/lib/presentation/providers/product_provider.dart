import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import '../../data/datasources/remote_api.dart';
import '../../data/repositories/product_repository_impl.dart';

final dioProvider = Provider((ref) => Dio(BaseOptions(baseUrl: const String.fromEnvironment('API_URL'))));
final remoteApiProvider = Provider((ref) => RemoteApi(ref.read(dioProvider)));
final productRepoProvider = Provider((ref) => ProductRepository(ref.read(remoteApiProvider)));
final productsFutureProvider = FutureProvider((ref) => ref.read(productRepoProvider).getAllProducts());

// Note: Do not call ref.watch or return widgets at the top level of a provider file.
// Consume `productsFutureProvider` from a widget (e.g. ConsumerWidget) like:
// final products = ref.watch(productsFutureProvider);
// products.when(data: ..., loading: ..., error: ...);
