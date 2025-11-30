class CartItem {
  final String id;
  final String productId;
  final int quantity;
  final String userId;

  CartItem({
    required this.id,
    required this.productId,
    required this.quantity,
    required this.userId,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      productId: json['productId'],
      quantity: json['quantity'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "quantity": quantity,
        "userId": userId,
      };
}
