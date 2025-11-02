class Order {
  final String id;
  final String userId;
  final List<dynamic> items;
  final double totalAmount;
  final DateTime date;

  Order({
    required this.id,
    required this.userId,
    required this.items,
    required this.totalAmount,
    required this.date,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json['id'],
    userId: json['userId'],
    items: json['items'],
    totalAmount: json['totalAmount'],
    date: DateTime.parse(json['date']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'userId': userId,
    'items': items,
    'totalAmount': totalAmount,
    'date': date.toIso8601String(),
  };
}
