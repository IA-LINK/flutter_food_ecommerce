import 'package:flutter/material.dart';
import '../domain/models/product_model.dart';
import 'cart_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel product;

  const ProductDetailsScreen({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              color: Colors.grey[300], // Placeholder for image
              child: const Center(child: Text('Product Image')),
            ),
            const SizedBox(height: 16),
            Text(product.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${product.cost}', style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
