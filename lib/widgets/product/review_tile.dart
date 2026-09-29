import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/review.dart';
import '../star_rating.dart';

class ReviewTile extends StatelessWidget {
  final Review review;

  const ReviewTile({super.key, required this.review});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        WDiv(
          className: 'flex flex-row items-center',
          children: [
            WDiv(
              className: 'ml-[1.5px]',
              child: WImage(
                src: 'asset://${review.avatar}',
                className: 'size-[36px] rounded-full object-cover',
              ),
            ),
            WDiv(
              className: 'flex-1 flex flex-col items-start ml-[10.5px]',
              children: [
                WText(
                  review.author,
                  className: 'font-mont text-[13px] font-medium text-charcoal',
                ),
                WDiv(
                  className: 'mt-[6px]',
                  child: StarRating(
                    rating: review.rating,
                    size: 'text-[13px]',
                    gap: 'ml-[2px]',
                  ),
                ),
              ],
            ),
            WText(review.time, className: 'font-body font-light text-[9.5px] text-fog'),
          ],
        ),
        WText(
          review.text,
          className: 'mt-[19px] pl-[1.5px] font-body font-light text-[10.1px] leading-[17px] text-jet',
        ),
      ],
    );
  }
}
