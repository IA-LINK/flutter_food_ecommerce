// lib/pages/cart_screen.dart
import 'package:flutter/material.dart';
import '../domain/models/product_model.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const String routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> cartItems = const [
      ProductModel(id: 1, title: 'Product 1', cost: 100),
      ProductModel(id: 2, title: 'Product 2', cost: 150),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final product = cartItems[index];
          return ListTile(
            title: Text(product.title),
            subtitle: Text('\$${product.cost}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: () {},
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, CheckoutScreen.routeName);
          },
          child: const Text('Proceed to Checkout'),
        ),
      ),
    );
  }
}
