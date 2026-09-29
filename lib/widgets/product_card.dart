import 'package:flutter/material.dart';

import '../models/product.dart';

/// Card vertical de produs: poza 126x172 + nume + pret.
/// Folosit in "Feature Products" (Home) si "Similar Product" (Product).
class ProductCard extends StatelessWidget {
  final Product product;
  final TextStyle nameStyle;
  final TextStyle priceStyle;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.product,
    required this.nameStyle,
    required this.priceStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 126,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.image,
                width: 126,
                height: 172,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 14),
            Text(
              product.name,
              style: nameStyle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4.5),
            Text(product.formattedPrice, style: priceStyle),
          ],
        ),
      ),
    );
  }
}
