// lib/pages/checkout_screen.dart
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Checkout Form Placeholder'),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Address'),
            ),
            TextField(
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Complete Order'),
            ),
          ],
        ),
      ),
    );
  }
}
