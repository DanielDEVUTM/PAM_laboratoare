import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/product.dart';
import '../../routes.dart';
import '../common/app_image.dart';
import 'section_header.dart';

class RecommendedSection extends StatelessWidget {
  final List<Product> products;
  final VoidCallback? onShowAll;

  const RecommendedSection({super.key, required this.products, this.onShowAll});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        SectionHeader(title: 'Recommended', onShowAll: onShowAll),
        WDiv(
          className: 'overflow-x-auto mt-[26.5px]',
          child: WDiv(
            className:
                'flex flex-row items-start gap-[16px] px-[32px] pb-[10px]',
            children: [
              for (final product in products)
                _RecommendedCard(
                  product: product,
                  onTap: () => Routes.openProduct(context, product.id),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RecommendedCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const _RecommendedCard({required this.product, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className: 'flex flex-row items-center w-[213px] h-[66px] bg-white rounded-lg border border-line shadow-card',
        children: [
          AppImage(
            product.imageUrl,
            width: 65,
            height: 64,
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(8),
            ),
          ),
          WDiv(
            className: 'flex-1 flex flex-col items-start pl-[9px] pt-[3px]',
            children: [
              WText(
                product.name,
                className: 'truncate text-[11px] font-medium text-ink',
              ),
              WText(
                product.formattedPrice,
                className: 'mt-[5px] text-[15px] font-bold text-ink',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
