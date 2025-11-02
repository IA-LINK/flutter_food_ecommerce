import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import '../services/payment_service.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final paymentService = PaymentService();

    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Total Amount: ₦${cart.totalAmount.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await paymentService.processPayment(cart.totalAmount);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Payment processed successfully!")),
                );
                cart.clearCart();
                Navigator.pop(context);
              },
              child: const Text('Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
