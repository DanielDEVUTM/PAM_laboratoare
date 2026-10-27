import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../cubits/products/products_cubit.dart';
import '../models/product.dart';
import '../routes.dart';
import '../widgets/catalog/filter_chips.dart';
import '../widgets/catalog/product_grid_card.dart';
import '../widgets/catalog/search_field.dart';
import '../widgets/catalog/sort_menu.dart';
import '../widgets/common/favorite_button.dart';
import '../widgets/common/screen_header.dart';
import '../widgets/common/state_views.dart';

/// Lista tuturor produselor, cu cautare, filtrare pe sectiuni si sortare.
class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: BlocBuilder<ProductsCubit, ProductsState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ScreenHeader(
                  title: 'Discover',
                  trailing: FavoritesBadge(
                    onTap: () => Navigator.pushNamed(context, Routes.favorites),
                  ),
                ),
                WDiv(
                  className: 'px-[24px]',
                  child: SearchField(
                    value: state.query,
                    onChanged: cubit.search,
                  ),
                ),
                WDiv(
                  className: 'mt-[16px]',
                  child: FilterChips<ProductSection>(
                    options: [
                      for (final section in ProductSection.values)
                        (section, section.label),
                    ],
                    selected: state.section,
                    onSelected: cubit.filterBySection,
                  ),
                ),
                WDiv(
                  className: 'flex flex-row items-center justify-between mt-[12px] px-[24px]',
                  children: [
                    WText(
                      '${state.visibleProducts.length} items',
                      className: 'text-[13px] text-muted',
                    ),
                    SortMenu(value: state.sort, onChanged: cubit.sortBy),
                  ],
                ),
                Expanded(child: _Body(state: state)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  final ProductsState state;

  const _Body({required this.state});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ProductsCubit>();

    switch (state.status) {
      case ProductsStatus.loading:
        return const LoadingView();
      case ProductsStatus.error:
        return ErrorView(
          message: state.errorMessage ?? 'Unknown error',
          onRetry: cubit.load,
        );
      case ProductsStatus.empty:
        return state.hasFilters
            ? EmptyView(
                title: 'No results',
                message: 'No products match your search or filter.',
                actionLabel: 'Clear filters',
                onAction: cubit.clearFilters,
              )
            : const EmptyView(
                title: 'No products yet',
                message: 'The JSON file has no products.',
                icon: Icons.inventory_2_outlined,
              );
      case ProductsStatus.success:
        return RefreshIndicator(
          onRefresh: cubit.load,
          child: GridView.builder(
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 16,
              childAspectRatio: 0.6,
            ),
            itemCount: state.visibleProducts.length,
            itemBuilder: (context, index) {
              final product = state.visibleProducts[index];
              return ProductGridCard(
                product: product,
                onTap: () => Routes.openProduct(context, product.id),
              );
            },
          ),
        );
    }
  }
}
