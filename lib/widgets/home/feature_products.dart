import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../data/app_data.dart';
import '../product_card.dart';
import 'section_header.dart';

class FeatureProducts extends StatelessWidget {
  const FeatureProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        const SectionHeader(title: 'Feature Products'),
        WDiv(
          className: 'overflow-x-auto mt-[17px]',
          child: WDiv(
            className: 'flex flex-row items-start gap-[20px] px-[35px]',
            children: [
              for (final product in AppData.featureProducts)
                ProductCard(
                  product: product,
                  nameClassName: 'text-[11px] font-medium text-ink',
                  priceClassName: 'text-[15px] font-bold text-ink',
                  onTap: () => Navigator.pushNamed(context, '/product'),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
