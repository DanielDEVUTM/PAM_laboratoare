import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../models/product.dart';

/// Card vertical de produs: poza 126x172 + nume + pret.
/// Folosit in "Feature Products" (Home) si "Similar Product" (Product).
class ProductCard extends StatelessWidget {
  final Product product;
  final String nameClassName;
  final String priceClassName;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.nameClassName,
    required this.priceClassName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className: 'flex flex-col items-start w-[126px]',
        children: [
          WImage(
            src: 'asset://${product.image}',
            className: 'w-[126px] h-[172px] rounded-lg object-cover',
          ),
          WText(product.name, className: 'mt-[14px] truncate $nameClassName'),
          WText(
            product.formattedPrice,
            className: 'mt-[4.5px] $priceClassName',
          ),
        ],
      ),
    );
  }
}
