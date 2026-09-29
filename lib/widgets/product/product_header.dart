import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/product.dart';
import '../star_rating.dart';

/// Numele, pretul si ratingul produsului.
class ProductHeader extends StatelessWidget {
  final Product product;
  final int ratingsCount;

  const ProductHeader({
    super.key,
    required this.product,
    required this.ratingsCount,
  });

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-row items-start justify-between',
      children: [
        WDiv(
          className: 'flex-1 flex flex-col items-start',
          children: [
            WText(
              product.name,
              className: 'font-mont text-[17.5px] font-medium text-ink',
            ),
            WDiv(
              className: 'flex flex-row items-center mt-[15.5px]',
              children: [
                const StarRating(),
                WText(
                  '($ratingsCount)',
                  className: 'ml-[5px] mt-[3px] font-body text-[11px] text-soot',
                ),
              ],
            ),
          ],
        ),
        WText(
          product.formattedPrice,
          className: 'font-mont text-[23.5px] font-semibold text-black',
        ),
      ],
    );
  }
}
