import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String iconUrl;
  final bool selected;

  const Category({
    required this.id,
    required this.name,
    this.iconUrl = '',
    this.selected = false,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      iconUrl: json['iconUrl'] as String? ?? '',
      selected: json['selected'] as bool? ?? false,
    );
  }

  /// Iconita locala (PNG), pentru ca iconUrl din JSON e SVG.
  String get iconAsset => 'assets/icons/$id.png';

  @override
  List<Object?> get props => [id, name, iconUrl, selected];
}
