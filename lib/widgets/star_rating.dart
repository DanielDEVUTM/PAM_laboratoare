import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Rand de stele verzi. [size] si [gap] sunt clase Wind, de ex. 'text-[21px]'.
class StarRating extends StatelessWidget {
  final int rating;
  final String size;
  final String gap;

  const StarRating({
    super.key,
    this.rating = 5,
    this.size = 'text-[21px]',
    this.gap = 'ml-[4px]',
  });

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-row items-center',
      children: [
        for (int i = 0; i < 5; i++)
          WDiv(
            className: i == 0 ? '' : gap,
            child: WIcon(
              i < rating ? Icons.star : Icons.star_border,
              className: '$size text-sage',
            ),
          ),
      ],
    );
  }
}
