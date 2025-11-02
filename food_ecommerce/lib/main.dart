import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const FoodEcommerceApp());
}

class FoodEcommerceApp extends StatelessWidget {
  const FoodEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Ecommerce',
      home: Scaffold(
        body: Center(child: Text("Welcome to Food Ecommerce")),
      ),
    );
  }
}
