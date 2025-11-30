import 'package:flutter/material.dart';
import 'checkout_screen.dart';

// Simple product model used by the cart screen
class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  const ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}

// Demo products used as a sample cart
const List<ProductModel> sampleProducts = [
  ProductModel(
    id: 'p1',
    title: 'Avocado Toast',
    imageUrl: 'https://via.placeholder.com/150',
    price: 8.99,
  ),
  ProductModel(
    id: 'p2',
    title: 'Berry Smoothie',
    imageUrl: 'https://via.placeholder.com/150',
    price: 5.49,
  ),
  ProductModel(
    id: 'p3',
    title: 'Caesar Salad',
    imageUrl: 'https://via.placeholder.com/150',
    price: 7.25,
  ),
];

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  // demo cart items
  List<ProductModel> get demoCart => sampleProducts;

  double get subtotal => demoCart.fold(0, (p, e) => p + e.price);

  @override
  Widget build(BuildContext context) {
    final items = demoCart;
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: items.length,
                separatorBuilder: (_,__) => const Divider(),
                itemBuilder: (_, idx) {
                  final it = items[idx];
                  return ListTile(
                    leading: Image.network(it.imageUrl, width: 56, height: 56, fit: BoxFit.cover),
                    title: Text(it.title),
                    subtitle: Text('\$${it.price.toStringAsFixed(2)}'),
                    trailing: const Text('x1'),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Subtotal', style: Theme.of(context).textTheme.titleMedium),
                Text('\$${subtotal.toStringAsFixed(2)}', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, CheckoutScreen.routeName),
                child: const Text('Proceed to Checkout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
