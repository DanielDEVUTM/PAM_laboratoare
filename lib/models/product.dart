import 'package:equatable/equatable.dart';

import 'review.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final String category;
  final double price;
  final String image;
  final double rating;
  final int ratingsCount;
  final String description;

  /// Nume de culori din tema Wind, de ex. 'beige', 'onyx'.
  final List<String> colors;
  final List<String> sizes;
  final bool isFeatured;
  final bool isRecommended;
  final DateTime createdAt;
  final List<Review> reviews;

  const Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.image,
    this.rating = 0,
    this.ratingsCount = 0,
    this.description = '',
    this.colors = const [],
    this.sizes = const [],
    this.isFeatured = false,
    this.isRecommended = false,
    required this.createdAt,
    this.reviews = const [],
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      category: json['category'] as String? ?? '',
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      ratingsCount: (json['ratings_count'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      colors: List<String>.from(json['colors'] as List? ?? const []),
      sizes: List<String>.from(json['sizes'] as List? ?? const []),
      isFeatured: json['is_featured'] as bool? ?? false,
      isRecommended: json['is_recommended'] as bool? ?? false,
      createdAt:
          DateTime.tryParse(json['created_at'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
      reviews: (json['reviews'] as List? ?? const [])
          .map((e) => Review.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  String get formattedPrice => '\$ ${price.toStringAsFixed(2)}';

  int get reviewsCount => reviews.length;

  /// Procentul de recenzii pentru fiecare numar de stele (5..1).
  List<(int, int)> get ratingBreakdown {
    final total = reviews.length;
    return [
      for (int stars = 5; stars >= 1; stars--)
        (
          stars,
          total == 0
              ? 0
              : (reviews.where((r) => r.rating == stars).length * 100 / total)
                    .round(),
        ),
    ];
  }

  @override
  List<Object?> get props => [id];
}
