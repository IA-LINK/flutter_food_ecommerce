// Plain immutable Product model without freezed/generator dependency.

class Product {
  final String id;
  final String title;
  final String? description;
  final double price;
  final String? category;
  final String? imageUrl;
  final int? stock;

  const Product({
    required this.id,
    required this.title,
    this.description,
    required this.price,
    this.category,
    this.imageUrl,
    this.stock,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as String,
        title: json['title'] as String,
        description: json['description'] as String?,
        price: (json['price'] as num).toDouble(),
        category: json['category'] as String?,
        imageUrl: json['imageUrl'] as String?,
        stock: json['stock'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'price': price,
        'category': category,
        'imageUrl': imageUrl,
        'stock': stock,
      };
}
