import 'package:flutter/material.dart';

class ProductModel {
  final String id;
  final String title;
  final String imageUrl;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
  });
}

class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback? onTap;

  const ProductCard({super.key, required this.product, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.network(product.imageUrl, height: 140, width: double.infinity, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.title, style: const TextStyle(fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text('\$${product.price.toStringAsFixed(2)}'),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(Icons.star, size: 14),
                  SizedBox(width: 4),
                  Text('4.5', style: TextStyle(fontSize: 12)),
                  Spacer(),
                  Icon(Icons.add_shopping_cart_outlined, size: 18),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
