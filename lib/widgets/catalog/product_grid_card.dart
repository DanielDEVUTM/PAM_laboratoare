import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/product.dart';
import '../common/favorite_button.dart';

/// Card pentru grila din Discover: poza cu buton de favorit, nume, pret, rating.
class ProductGridCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductGridCard({
    super.key,
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(product.image, fit: BoxFit.cover),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: FavoriteButton(productId: product.id, size: 28),
                ),
              ],
            ),
          ),
          WText(
            product.name,
            className: 'mt-[10px] truncate text-[12px] font-medium text-ink',
          ),
          WDiv(
            className: 'flex flex-row items-center justify-between mt-[4px]',
            children: [
              WText(
                product.formattedPrice,
                className: 'text-[15px] font-bold text-ink',
              ),
              WDiv(
                className: 'flex flex-row items-center',
                children: [
                  const WIcon(Icons.star, className: 'text-[14px] text-sage'),
                  WText(
                    product.rating.toStringAsFixed(1),
                    className: 'ml-[2px] text-[11px] text-soot',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
