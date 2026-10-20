import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String icon;

  const Category({required this.id, required this.name, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      icon: json['icon'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, icon];
}
