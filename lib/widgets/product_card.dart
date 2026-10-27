import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../models/product.dart';
import 'common/app_image.dart';

/// Card vertical de produs: poza 126x172 + nume + pret.
/// Folosit in "Feature Products" (Home) si "Similar Product" (Product).
class ProductCard extends StatelessWidget {
  final Product product;
  final String nameClassName;
  final String priceClassName;

  /// Distanta dintre poza si nume.
  final String nameMargin;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.nameClassName,
    required this.priceClassName,
    this.nameMargin = 'mt-[14px]',
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className: 'flex flex-col items-start w-[126px]',
        children: [
          AppImage(
            product.imageUrl,
            width: 126,
            height: 172,
            borderRadius: BorderRadius.circular(8),
          ),
          WText(product.name, className: '$nameMargin truncate $nameClassName'),
          WText(
            product.formattedPrice,
            className: 'mt-[4.5px] $priceClassName',
          ),
        ],
      ),
    );
  }
}
