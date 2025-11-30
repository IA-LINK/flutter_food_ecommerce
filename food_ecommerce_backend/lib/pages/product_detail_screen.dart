import 'package:flutter/material.dart';
import 'cart_screen.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final double price;

  const ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
  });
}

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product';
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)!.settings.arguments as ProductModel?;
    if (product == null) {
      return const Scaffold(body: Center(child: Text('No product selected')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          IconButton(icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, CartScreen.routeName)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(product.imageUrl, width: double.infinity, height: 240, fit: BoxFit.cover),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(product.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(product.description),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  // Quantity selector (simple)
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all()),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(padding: EdgeInsets.all(8), child: Icon(Icons.remove)),
                        Padding(padding: EdgeInsets.all(8), child: Text('1')),
                        Padding(padding: EdgeInsets.all(8), child: Icon(Icons.add)),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: add to cart logic
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Added to cart (demo)')));
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Add to cart'),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
