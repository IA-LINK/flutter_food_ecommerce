import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../models/product_model.dart';

class ProductScreen extends StatelessWidget {
  final Product product;
  const ProductScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(product.imageUrl, height: 300, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              product.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('₦${product.price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, color: Colors.green)),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(product.description, textAlign: TextAlign.center),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                cart.addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Added to cart")),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Add to Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
