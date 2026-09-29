class Product {
  final String name;
  final double price;
  final String image;

  const Product({
    required this.name,
    required this.price,
    required this.image,
  });

  String get formattedPrice => '\$ ${price.toStringAsFixed(2)}';
}
