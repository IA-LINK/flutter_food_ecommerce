// lib/pages/home_screen.dart
import 'package:flutter/material.dart';
import '../domain/models/product_model.dart';
import 'cart_screen.dart';
import 'product_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String routeName = '/home';

  final List<ProductModel> products = const [
    ProductModel(id: 1, title: 'Product 1', cost: 100),
    ProductModel(id: 2, title: 'Product 2', cost: 150),
    ProductModel(id: 3, title: 'Product 3', cost: 200),
    ProductModel(id: 4, title: 'Product 4', cost: 250),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(product.title),
              subtitle: Text('\$${product.cost}'),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(product: product),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
