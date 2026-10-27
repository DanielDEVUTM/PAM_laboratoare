import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../cubits/products/products_cubit.dart';
import '../models/product.dart';
import '../widgets/common/screen_header.dart';
import '../widgets/common/state_views.dart';
import '../widgets/product/add_to_cart_bar.dart';
import '../widgets/product/expandable_section.dart';
import '../widgets/product/product_description.dart';
import '../widgets/product/product_header.dart';
import '../widgets/product/product_hero.dart';
import '../widgets/product/product_options.dart';
import '../widgets/product/rating_summary.dart';
import '../widgets/product/review_tile.dart';
import '../widgets/product/similar_products.dart';

/// Pagina de detalii. Primeste id-ul produsului ca argument al rutei.
class ProductScreen extends StatelessWidget {
  final String productId;

  const ProductScreen({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ProductsCubit>().state;
    final product = state.productById(productId);

    if (product == null) {
      return const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              ScreenHeader(title: 'Product'),
              Expanded(
                child: EmptyView(
                  title: 'Product not found',
                  message: 'This product is no longer available.',
                  icon: Icons.inventory_2_outlined,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final similar = product.similarProducts;

    return Scaffold(
      backgroundColor: context.wColorExt('cream'),
      bottomNavigationBar: AddToCartBar(
        label: product.addToCartLabel,
        onTap: product.canAddToCart
            ? () => ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('${product.name} a fost adaugat in cos'),
                  ),
                )
            : null,
      ),
      body: WDiv(
        className: 'flex flex-col items-stretch overflow-y-auto',
        children: [
          ProductHero(productId: product.id, images: product.images),
          WDiv(
            className: 'flex flex-col items-stretch pt-[50.5px] pb-[38px] bg-white rounded-t-2xl shadow-sheet',
            children: [
              WDiv(
                className: 'flex flex-col items-stretch px-[32px]',
                children: [
                  ProductHeader(product: product),
                  const WDiv(className: 'h-[1px] mt-[16px] bg-divider'),
                  if (product.colors.isNotEmpty ||
                      product.sizes.isNotEmpty) ...[
                    WDiv(
                      className: 'mt-[16px]',
                      child: ProductOptions(
                        key: ValueKey(product.id),
                        product: product,
                      ),
                    ),
                    const WDiv(className: 'h-[1px] mt-[32px] bg-divider'),
                  ],
                  if (product.description.isNotEmpty)
                    ExpandableSection(
                      title: 'Description',
                      initiallyExpanded: product.descriptionExpanded,
                      child: ProductDescription(text: product.description),
                    ),
                  if (product.hasDetails)
                    ExpandableSection(
                      title: 'Reviews',
                      child: _Reviews(product: product),
                    ),
                ],
              ),
              if (similar.isNotEmpty)
                WDiv(
                  className: 'mt-[13.5px]',
                  child: ExpandableSection(
                    title: 'Similar Product',
                    headerClassName: 'px-[31px]',
                    child: SimilarProducts(products: similar),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Reviews extends StatelessWidget {
  final Product product;

  const _Reviews({required this.product});

  @override
  Widget build(BuildContext context) {
    final reviews = product.reviews;

    return WDiv(
      className: 'flex flex-col items-stretch pt-[28.5px] pb-[20px]',
      children: [
        RatingSummary(product: product),
        if (reviews.isEmpty)
          const WText(
            'No reviews yet. Be the first to write one!',
            className: 'mt-[30px] font-body font-light text-[11px] text-silver',
          ),
        for (int i = 0; i < reviews.length; i++)
          WDiv(
            className: i == 0 ? 'mt-[39.5px]' : 'mt-[34px]',
            child: ReviewTile(review: reviews[i]),
          ),
      ],
    );
  }
}
