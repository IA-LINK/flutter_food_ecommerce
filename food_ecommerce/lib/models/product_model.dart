class Product {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json, String docId) {
    return Product(
      id: json['id'] ?? docId, // Use Firestore doc ID if no id field
      name: json['name'] ?? '',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      imageUrl: json['imageUrl'] ?? json['image'] ?? '',
      description: json['description'] ?? json['desc'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'imageUrl': imageUrl,
        'description': description,
      };
}
