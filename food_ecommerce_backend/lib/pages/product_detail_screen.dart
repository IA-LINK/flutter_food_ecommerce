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
      return const Scaffold(
        body: Center(
          child: Text('No product selected'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () =>
                Navigator.pushNamed(context, CartScreen.routeName),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product image
            Image.network(
              product.imageUrl,
              width: double.infinity,
              height: 240,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.broken_image, size: 200),
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                product.title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 15),
              ),
            ),

            const SizedBox(height: 12),

            // Add to cart row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  // Quantity (static for now)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.remove),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Text('1'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8),
                          child: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),

                  // Add to cart button
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Replace with cart provider logic
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Added to cart (demo)'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: const Text('Add to cart'),
                  ),
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
