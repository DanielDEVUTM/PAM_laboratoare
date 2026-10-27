import 'package:equatable/equatable.dart';

/// Bannerul mare de sus (carusel).
class HeroBanner extends Equatable {
  final String id;
  final String title;
  final String imageUrl;
  final String action;
  final int slides;
  final int activeSlide;

  const HeroBanner({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.action = '',
    this.slides = 1,
    this.activeSlide = 0,
  });

  factory HeroBanner.fromJson(Map<String, dynamic> json) {
    return HeroBanner(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
      action: json['action'] as String? ?? '',
      slides: (json['slides'] as num?)?.toInt() ?? 1,
      activeSlide: (json['activeSlide'] as num?)?.toInt() ?? 0,
    );
  }

  @override
  List<Object?> get props => [id, title, imageUrl, action, slides, activeSlide];
}

/// Banner cu eticheta si titlu: "New Collection", "Top Collection".
class Collection extends Equatable {
  final String id;
  final String label;
  final String title;
  final String imageUrl;

  const Collection({
    this.id = '',
    required this.label,
    required this.title,
    required this.imageUrl,
  });

  factory Collection.fromJson(Map<String, dynamic> json) {
    return Collection(
      id: json['id'] as String? ?? '',
      label: json['label'] as String? ?? '',
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, label, title, imageUrl];
}

/// Cardurile mici din Top Collection (T-Shirts, Dresses).
class CategoryPromo extends Equatable {
  final String id;
  final String category;
  final String title;
  final String imageUrl;

  const CategoryPromo({
    required this.id,
    required this.category,
    required this.title,
    required this.imageUrl,
  });

  factory CategoryPromo.fromJson(Map<String, dynamic> json) {
    return CategoryPromo(
      id: json['id'] as String? ?? '',
      category: json['category'] as String? ?? '',
      title: json['title'] as String? ?? '',
      imageUrl: json['imageUrl'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, category, title, imageUrl];
}
