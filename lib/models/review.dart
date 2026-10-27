import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String id;
  final String author;
  final String avatarUrl;
  final String time;
  final double rating;
  final String text;

  const Review({
    required this.id,
    required this.author,
    required this.avatarUrl,
    required this.time,
    required this.rating,
    required this.text,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] as String? ?? '',
      author: json['author'] as String? ?? '',
      avatarUrl: json['avatarUrl'] as String? ?? '',
      time: json['createdAtLabel'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0,
      text: json['text'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [id, author, avatarUrl, time, rating, text];
}
