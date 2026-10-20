import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../cubits/favorites/favorites_cubit.dart';
import '../cubits/products/products_cubit.dart';
import '../models/product.dart';
import '../routes.dart';
import '../widgets/common/screen_header.dart';
import '../widgets/common/state_views.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.select<ProductsCubit, List<Product>>(
      (cubit) => cubit.state.allProducts,
    );
    final favoriteIds = context.watch<FavoritesCubit>().state;
    final favorites = products
        .where((p) => favoriteIds.contains(p.id))
        .toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ScreenHeader(title: 'Favorites'),
            Expanded(
              child: favorites.isEmpty
                  ? EmptyView(
                      title: 'No favorites yet',
                      message: 'Tap the heart on a product to save it here.',
                      icon: Icons.favorite_border,
                      actionLabel: 'Discover products',
                      onAction: () => Navigator.pushReplacementNamed(
                        context,
                        Routes.catalog,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
                      itemCount: favorites.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 16),
                      itemBuilder: (context, index) =>
                          _FavoriteTile(product: favorites[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteTile extends StatelessWidget {
  final Product product;

  const _FavoriteTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return WAnchor(
      onTap: () => Routes.openProduct(context, product.id),
      child: WDiv(
        className: 'flex flex-row items-center h-[96px] bg-white rounded-lg border border-line shadow-card',
        children: [
          WImage(
            src: 'asset://${product.image}',
            className: 'w-[84px] h-[96px] rounded-l-lg object-cover',
          ),
          WDiv(
            className: 'flex-1 flex flex-col items-start pl-[14px]',
            children: [
              WText(
                product.name,
                className: 'truncate text-[13px] font-medium text-ink',
              ),
              WText(
                product.formattedPrice,
                className: 'mt-[6px] text-[16px] font-bold text-ink',
              ),
            ],
          ),
          WAnchor(
            onTap: () => context.read<FavoritesCubit>().remove(product.id),
            child: const WDiv(
              className: 'p-[16px]',
              child: WIcon(
                Icons.delete_outline,
                className: 'text-[22px] text-salmon',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
