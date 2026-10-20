import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/product.dart';
import '../../routes.dart';
import '../product_card.dart';
import 'section_header.dart';

class FeatureProducts extends StatelessWidget {
  final List<Product> products;
  final VoidCallback? onShowAll;

  const FeatureProducts({super.key, required this.products, this.onShowAll});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        SectionHeader(title: 'Feature Products', onShowAll: onShowAll),
        WDiv(
          className: 'overflow-x-auto mt-[17px]',
          child: WDiv(
            className: 'flex flex-row items-start gap-[20px] px-[35px]',
            children: [
              for (final product in products)
                ProductCard(
                  product: product,
                  nameClassName: 'text-[11px] font-medium text-ink',
                  priceClassName: 'text-[15px] font-bold text-ink',
                  onTap: () => Routes.openProduct(context, product.id),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
