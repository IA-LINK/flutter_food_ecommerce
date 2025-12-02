class ProductModel {
  final int id;
  final String title; // maybe it's called title, not name
  final double cost;  // maybe it's called cost, not price

  const ProductModel({
    required this.id,
    required this.title,
    required this.cost,
  });
}
