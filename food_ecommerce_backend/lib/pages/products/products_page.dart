import 'package:flutter/material.dart';
import 'package:food_ecommerce_backend/data/repositories/product_repository.dart';
import 'package:food_ecommerce_backend/domain/usecases/get_products.dart';
import 'package:food_ecommerce_backend/widgets/product_card.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final getProducts = GetProductsUseCase(ProductRepository());

  @override
  Widget build(BuildContext context) {
    final productList = getProducts.execute();

    return Scaffold(
      appBar: AppBar(title: const Text("Food Menu")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.73,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productList.length,
        itemBuilder: (context, index) {
          final product = productList[index];

          return ProductCard(
            product: product,
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product',
                arguments: product,
              );
            },
          );
        },
      ),
    );
  }
}
