import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = '/checkout';
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // demo form only
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextFormField(decoration: const InputDecoration(labelText: 'Full name')),
            const SizedBox(height: 8),
            TextFormField(decoration: const InputDecoration(labelText: 'Phone')),
            const SizedBox(height: 8),
            TextFormField(decoration: const InputDecoration(labelText: 'Address')),
            const SizedBox(height: 8),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: 'Payment method'),
              items: const [
                DropdownMenuItem(value: 'card', child: Text('Card (Stripe)')),
                DropdownMenuItem(value: 'cod', child: Text('Cash on delivery')),
              ],
              onChanged: (_) {},
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: perform payment -> create order
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Order placed (demo)')));
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: const Text('Place Order'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
