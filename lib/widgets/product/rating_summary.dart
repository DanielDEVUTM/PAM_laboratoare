import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/product.dart';
import '../star_rating.dart';

/// Nota medie, distributia pe stele si numarul de recenzii.
class RatingSummary extends StatelessWidget {
  final Product product;

  const RatingSummary({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        WDiv(
          className: 'flex flex-row items-start justify-between',
          children: [
            WDiv(
              className: 'flex flex-row items-end',
              children: [
                WText(
                  (product.rating ?? 0).toStringAsFixed(1),
                  className: 'font-mont text-[34px] font-semibold leading-[34px] text-night',
                ),
                const WText(
                  'OUT OF 5',
                  className:
                      'ml-[7.5px] mb-[7px] font-body text-[10.5px] text-ash',
                ),
              ],
            ),
            WDiv(
              className: 'flex flex-col items-end',
              children: [
                StarRating(
                  rating: (product.rating ?? 0).round(),
                  size: 'text-[20px]',
                  gap: 'ml-[1px]',
                ),
                WText(
                  '${product.ratingCount} ratings',
                  className:
                      'mt-[5px] font-body font-light text-[10px] text-ghost',
                ),
              ],
            ),
          ],
        ),
        WDiv(
          className: 'flex flex-col items-stretch mt-[11px]',
          children: [
            for (final share in product.ratingBreakdown)
              _RatingBar(stars: share.stars, percent: share.percentage),
          ],
        ),
        WDiv(
          className: 'flex flex-row items-center justify-between mt-[21px]',
          children: [
            WText(
              '${product.reviewCount} Reviews',
              className: 'font-body font-light text-[10.5px] text-silver',
            ),
            WAnchor(
              onTap: () {},
              child: const WDiv(
                className: 'flex flex-row items-center',
                children: [
                  WText(
                    'WRITE A REVIEW',
                    className: 'font-body text-[9px] text-silver',
                  ),
                  WDiv(
                    className: 'ml-[6px]',
                    child: WIcon(
                      Icons.edit,
                      className: 'text-[15px] text-cloud',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RatingBar extends StatelessWidget {
  final int stars;
  final int percent;

  const _RatingBar({required this.stars, required this.percent});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-row items-center h-[29px]',
      children: [
        WText(
          '$stars',
          className: 'w-[10px] font-body font-light text-[10.5px] text-haze',
        ),
        const WIcon(Icons.star, className: 'ml-[2px] text-[14px] text-sage'),
        WDiv(
          className: 'flex-1 ml-[10px] mr-[16px]',
          child: WDiv(
            className: 'relative h-[4px] rounded-full bg-track',
            children: [
              FractionallySizedBox(
                // ca in macheta, o bara care nu e 0% are mereu o lungime minima vizibila
                widthFactor: percent == 0
                    ? 0
                    : (0.04 + percent / 100).clamp(0.0, 1.0),
                child: const WDiv(className: 'h-[4px] rounded-full bg-sage'),
              ),
            ],
          ),
        ),
        WDiv(
          className: 'w-[24px] flex flex-row justify-end',
          children: [
            WText('$percent%', className: 'font-body text-[10.5px] text-coal'),
          ],
        ),
      ],
    );
  }
}
