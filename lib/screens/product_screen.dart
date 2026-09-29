import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../data/app_data.dart';
import '../widgets/product/product_header.dart';
import '../widgets/product/product_hero.dart';
import '../widgets/product/product_options.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const product = AppData.sportwearSet;

    return Scaffold(
      backgroundColor: context.wColorExt('cream'),
      body: WDiv(
        className: 'flex flex-col items-stretch overflow-y-auto',
        children: [
          ProductHero(image: product.image),
          const WDiv(
            className:
                'flex flex-col items-stretch px-[32px] pt-[50.5px] pb-[40px] bg-white rounded-t-2xl shadow-sheet',
            children: [
              ProductHeader(
                product: product,
                ratingsCount: AppData.ratingsCount,
              ),
              WDiv(className: 'h-[1px] mt-[16px] bg-divider'),
              WDiv(className: 'mt-[16px]', child: ProductOptions()),
              WDiv(className: 'h-[1px] mt-[32px] bg-divider'),
            ],
          ),
        ],
      ),
    );
  }
}
