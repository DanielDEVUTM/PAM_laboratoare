import 'package:flutter/material.dart';

import '../../data/app_data.dart';
import '../../theme/app_text_styles.dart';
import '../product_card.dart';
import 'section_header.dart';

class FeatureProducts extends StatelessWidget {
  const FeatureProducts({super.key});

  @override
  Widget build(BuildContext context) {
    const products = AppData.featureProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SectionHeader(title: 'Feature Products'),
        const SizedBox(height: 17),
        SizedBox(
          height: 230,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 35),
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemBuilder: (context, index) => ProductCard(
              product: products[index],
              nameStyle: HomeTextStyles.productName,
              priceStyle: HomeTextStyles.productPrice,
              onTap: () => Navigator.pushNamed(context, '/product'),
            ),
          ),
        ),
      ],
    );
  }
}
