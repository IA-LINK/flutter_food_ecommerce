class CartItem {
  final String id;
  final String name;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.price,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'quantity': quantity,
        'price': price,
      };
}

class OrderModel {
  final String id;
  final List<CartItem> items;
  final double deliveryFee;
  final double totalAmount;
  final String status;
  final String paymentStatus;
  final String userId;

  OrderModel({
    required this.id,
    required this.items,
    required this.deliveryFee,
    required this.totalAmount,
    required this.status,
    required this.paymentStatus,
    required this.userId,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'],
      items: (json['items'] as List)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      deliveryFee: (json['deliveryFee'] as num).toDouble(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      status: json['status'] as String,
      paymentStatus: json['paymentStatus'] as String,
      userId: json['userId'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "items": items.map((e) => e.toJson()).toList(),
        "deliveryFee": deliveryFee,
        "totalAmount": totalAmount,
        "status": status,
        "paymentStatus": paymentStatus,
        "userId": userId,
      };
}
