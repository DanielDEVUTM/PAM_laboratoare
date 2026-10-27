import 'dart:ui';

import 'package:equatable/equatable.dart';

import 'review.dart';

/// Sectiunea din JSON in care apare produsul (folosita la filtrare).
enum ProductSection {
  featured('Feature Products'),
  recommended('Recommended'),
  similar('Similar');

  final String label;
  const ProductSection(this.label);
}

class ProductColor extends Equatable {
  final String id;
  final String name;
  final Color color;

  const ProductColor({
    required this.id,
    required this.name,
    required this.color,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    final hex = (json['value'] as String? ?? '#000000').replaceFirst('#', '');
    return ProductColor(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      color: Color(int.parse(hex.padLeft(6, '0'), radix: 16) | 0xFF000000),
    );
  }

  @override
  List<Object?> get props => [id, name, color];
}

/// Procentul de recenzii cu un anumit numar de stele.
class RatingShare extends Equatable {
  final int stars;
  final int percentage;

  const RatingShare({required this.stars, required this.percentage});

  factory RatingShare.fromJson(Map<String, dynamic> json) {
    return RatingShare(
      stars: (json['stars'] as num?)?.toInt() ?? 0,
      percentage: (json['percentage'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [stars, percentage];
}

/// Produs din JSON. In listele de pe Home un produs are doar id, nume, pret
/// si poza; produsul din `productPage` are si detaliile (galerie, rating,
/// culori, marimi, recenzii, produse similare).
class Product extends Equatable {
  final String id;
  final String name;
  final double price;
  final String currency;
  final String imageUrl;
  final List<String> galleryImageUrls;
  final double? rating;
  final int ratingCount;
  final int reviewCount;
  final String description;
  final bool descriptionExpanded;
  final List<ProductColor> colors;
  final String? selectedColor;
  final List<String> sizes;
  final String? selectedSize;
  final Map<String, bool> sizeAvailability;
  final List<RatingShare> ratingBreakdown;
  final List<Review> reviews;
  final List<Product> similarProducts;
  final bool isFavorite;
  final bool canAddToCart;
  final String addToCartLabel;
  final Set<ProductSection> sections;

  const Product({
    required this.id,
    required this.name,
    required this.price,
    this.currency = 'USD',
    required this.imageUrl,
    this.galleryImageUrls = const [],
    this.rating,
    this.ratingCount = 0,
    this.reviewCount = 0,
    this.description = '',
    this.descriptionExpanded = false,
    this.colors = const [],
    this.selectedColor,
    this.sizes = const [],
    this.selectedSize,
    this.sizeAvailability = const {},
    this.ratingBreakdown = const [],
    this.reviews = const [],
    this.similarProducts = const [],
    this.isFavorite = false,
    this.canAddToCart = true,
    this.addToCartLabel = 'Add To Cart',
    this.sections = const {},
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final actions = json['actions'] as Map<String, dynamic>? ?? const {};
    List<T> list<T>(String key, T Function(Map<String, dynamic>) parse) =>
        (json[key] as List? ?? const [])
            .map((e) => parse(e as Map<String, dynamic>))
            .toList();

    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'USD',
      imageUrl: (json['imageUrl'] ?? json['mainImageUrl']) as String? ?? '',
      galleryImageUrls: List<String>.from(
        json['galleryImageUrls'] as List? ?? const [],
      ),
      rating: (json['rating'] as num?)?.toDouble(),
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      reviewCount: (json['reviewCount'] as num?)?.toInt() ?? 0,
      description: json['description'] as String? ?? '',
      descriptionExpanded: json['descriptionExpanded'] as bool? ?? false,
      colors: list('availableColors', ProductColor.fromJson),
      selectedColor: json['selectedColor'] as String?,
      sizes: List<String>.from(json['availableSizes'] as List? ?? const []),
      selectedSize: json['selectedSize'] as String?,
      sizeAvailability: Map<String, bool>.from(
        json['sizeAvailability'] as Map? ?? const {},
      ),
      ratingBreakdown: list('ratingBreakdown', RatingShare.fromJson),
      reviews: list('reviews', Review.fromJson),
      similarProducts: list('similarProducts', Product.fromJson),
      isFavorite: actions['isFavorite'] as bool? ?? false,
      canAddToCart: actions['canAddToCart'] as bool? ?? true,
      addToCartLabel: actions['addToCartLabel'] as String? ?? 'Add To Cart',
    );
  }

  /// Produsul are pagina de detalii completa (rating, culori, recenzii...).
  bool get hasDetails => rating != null || description.isNotEmpty;

  /// Pozele pentru caruselul din pagina de detalii.
  List<String> get images =>
      galleryImageUrls.isNotEmpty ? galleryImageUrls : [imageUrl];

  bool isSizeAvailable(String size) => sizeAvailability[size] ?? true;

  String get formattedPrice {
    final symbol = switch (currency) {
      'USD' => '\$ ',
      'EUR' => '€ ',
      _ => '$currency ',
    };
    return '$symbol${price.toStringAsFixed(2)}';
  }

  /// Pentru un produs care in JSON are doar nume, pret si poza: ia restul
  /// pagini de detalii (rating, culori, marimi, descriere, recenzii, produse
  /// similare) din [template], adica din `productPage` al JSON-ului.
  Product withDetailsFrom(Product template) {
    if (hasDetails) return this;
    return Product(
      id: id,
      name: name,
      price: price,
      currency: currency,
      imageUrl: imageUrl,
      rating: template.rating,
      ratingCount: template.ratingCount,
      reviewCount: template.reviewCount,
      description: template.description,
      descriptionExpanded: template.descriptionExpanded,
      colors: template.colors,
      selectedColor: template.selectedColor,
      sizes: template.sizes,
      selectedSize: template.selectedSize,
      sizeAvailability: template.sizeAvailability,
      ratingBreakdown: template.ratingBreakdown,
      reviews: template.reviews,
      similarProducts: [
        for (final p in template.similarProducts)
          if (p.id != id) p,
      ],
      canAddToCart: template.canAddToCart,
      addToCartLabel: template.addToCartLabel,
      sections: sections,
    );
  }

  Product copyWith({Set<ProductSection>? sections}) {
    return Product(
      id: id,
      name: name,
      price: price,
      currency: currency,
      imageUrl: imageUrl,
      galleryImageUrls: galleryImageUrls,
      rating: rating,
      ratingCount: ratingCount,
      reviewCount: reviewCount,
      description: description,
      descriptionExpanded: descriptionExpanded,
      colors: colors,
      selectedColor: selectedColor,
      sizes: sizes,
      selectedSize: selectedSize,
      sizeAvailability: sizeAvailability,
      ratingBreakdown: ratingBreakdown,
      reviews: reviews,
      similarProducts: similarProducts,
      isFavorite: isFavorite,
      canAddToCart: canAddToCart,
      addToCartLabel: addToCartLabel,
      sections: sections ?? this.sections,
    );
  }

  @override
  List<Object?> get props => [id, name, price, sections, hasDetails];
}
