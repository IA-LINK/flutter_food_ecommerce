import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
import 'pages/product_detail_screen.dart';
import 'pages/cart_screen.dart';
import 'pages/checkout_screen.dart';

void main() {
  runApp(const FoodEcommerceApp());
}

class FoodEcommerceApp extends StatelessWidget {
  const FoodEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Ecommerce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        useMaterial3: true,
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => const HomeScreen(),
        ProductDetailScreen.routeName: (_) => const ProductDetailScreen(),
        CartScreen.routeName: (_) => const CartScreen(),
        CheckoutScreen.routeName: (_) => const CheckoutScreen(),
      },
    );
  }
}
