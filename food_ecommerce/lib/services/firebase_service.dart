import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> fetchProducts() async {
    try {
      final snapshot = await _firestore.collection('products').get();
      return snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        // Safely parse each product
        return Product.fromJson(data, doc.id);
      }).toList();
    } catch (e) {
      print("Error in FirebaseService.fetchProducts: $e");
      return []; // Return empty list instead of crashing
    }
  }
}
