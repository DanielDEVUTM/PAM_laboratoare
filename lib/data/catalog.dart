import '../models/category.dart';
import '../models/product.dart';

/// Datele din fisierul JSON, dupa parsare.
class Catalog {
  final List<Category> categories;
  final List<Product> products;

  const Catalog({required this.categories, required this.products});

  factory Catalog.fromJson(Map<String, dynamic> json) {
    return Catalog(
      categories: (json['categories'] as List? ?? const [])
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List? ?? const [])
          .map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
