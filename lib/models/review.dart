import 'package:equatable/equatable.dart';

class Review extends Equatable {
  final String author;
  final String avatar;
  final String time;
  final int rating;
  final String text;

  const Review({
    required this.author,
    required this.avatar,
    required this.time,
    required this.rating,
    required this.text,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      time: json['time'] as String? ?? '',
      rating: (json['rating'] as num?)?.toInt() ?? 0,
      text: json['text'] as String? ?? '',
    );
  }

  @override
  List<Object?> get props => [author, avatar, time, rating, text];
}
