// lib/main.dart
import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/cart_screen.dart';
import 'pages/checkout_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ecommerce',
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        CartScreen.routeName: (_) => const CartScreen(),
        CheckoutScreen.routeName: (_) => const CheckoutScreen(),
      },
    );
  }
}
