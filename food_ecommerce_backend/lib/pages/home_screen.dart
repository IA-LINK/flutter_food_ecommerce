import 'package:flutter/material.dart';
import '../widgets/product_card.dart';
import 'product_detail_screen.dart' hide ProductModel;
import 'cart_screen.dart' hide ProductModel;

// Sample products (use ProductModel defined in widgets/product_card.dart)
final List<ProductModel> sampleProducts = [
  ProductModel(
    id: 'p1',
    title: 'Margherita Pizza',
    price: 8.99,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  ProductModel(
    id: 'p2',
    title: 'Salmon Sushi',
    price: 12.50,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  ProductModel(
    id: 'p3',
    title: 'Caesar Salad',
    price: 6.75,
    imageUrl: 'https://via.placeholder.com/150',
  ),
  ProductModel(
    id: 'p4',
    title: 'Blueberry Smoothie',
    price: 4.99,
    imageUrl: 'https://via.placeholder.com/150',
  ),
];

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () => Navigator.pushNamed(context, CartScreen.routeName),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Search bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search food, restaurants...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              ),
            ),
            const SizedBox(height: 12),
            // Categories (simple placeholders)
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final cat in ['Pizza', 'Sushi', 'Salad', 'Drinks'])
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Chip(label: Text(cat)),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            // Product list
            Expanded(
              child: GridView.builder(
                itemCount: sampleProducts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 260,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final p = sampleProducts[index];
                  return ProductCard(
                    product: p,
                    onTap: () {
                      Navigator.pushNamed(context, ProductDetailScreen.routeName, arguments: p);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
