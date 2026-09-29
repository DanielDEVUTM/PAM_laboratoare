import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../data/app_data.dart';
import '../product_card.dart';

/// Lista orizontala "Similar Product", pe toata latimea ecranului.
class SimilarProducts extends StatelessWidget {
  const SimilarProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'overflow-x-auto pt-[30px]',
      child: WDiv(
        className: 'flex flex-row items-start gap-[20px] px-[31px]',
        children: [
          for (final product in AppData.similarProducts)
            ProductCard(
              product: product,
              nameClassName: 'font-mont text-[11.5px] text-ink',
              priceClassName: 'font-mont text-[14.5px] font-medium text-ink',
              nameMargin: 'mt-[10.5px]',
            ),
        ],
      ),
    );
  }
}
