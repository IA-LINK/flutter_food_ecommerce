// lib/pages/home_screen.dart

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  // Add this static member
  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('Product 1'),
            subtitle: Text('\$100'),
          ),
          ListTile(
            title: Text('Product 2'),
            subtitle: Text('\$150'),
          ),
          ListTile(
            title: Text('Product 3'),
            subtitle: Text('\$200'),
          ),
          ListTile(
            title: Text('Product 4'),
            subtitle: Text('\$250'),
          ),
        ],
      ),
    );
  }
}
