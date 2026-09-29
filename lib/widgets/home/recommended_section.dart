import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../data/app_data.dart';
import '../../models/product.dart';
import 'section_header.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        const SectionHeader(title: 'Recommended'),
        WDiv(
          className: 'overflow-x-auto mt-[26.5px]',
          child: WDiv(
            className: 'flex flex-row items-start gap-[16px] px-[32px] pb-[10px]',
            children: [
              for (final product in AppData.recommended)
                _RecommendedCard(
                  product: product,
                  onTap: () => Navigator.pushNamed(context, '/product'),
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
        className:
            'flex flex-row items-center w-[213px] h-[66px] bg-white rounded-lg border border-line shadow-card',
        children: [
          WImage(
            src: 'asset://${product.image}',
            className: 'w-[65px] h-[64px] rounded-l-lg object-cover',
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
