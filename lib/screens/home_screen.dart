import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../cubits/products/products_cubit.dart';
import '../models/product.dart';
import '../routes.dart';
import '../widgets/common/state_views.dart';
import '../widgets/home/banner_carousel.dart';
import '../widgets/home/category_selector.dart';
import '../widgets/home/feature_products.dart';
import '../widgets/home/home_header.dart';
import '../widgets/home/new_collection_banner.dart';
import '../widgets/home/recommended_section.dart';
import '../widgets/home/top_collection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            HomeHeader(
              storeName: context.select<ProductsCubit, String>(
                (cubit) => cubit.state.catalog.storeName,
              ),
            ),
            Expanded(
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state.status == ProductsStatus.loading) {
                    return const LoadingView();
                  }
                  if (state.status == ProductsStatus.error) {
                    return ErrorView(
                      message: state.errorMessage ?? 'Unknown error',
                      onRetry: context.read<ProductsCubit>().load,
                    );
                  }
                  if (state.allProducts.isEmpty) {
                    return const EmptyView(
                      title: 'No products yet',
                      message: 'The JSON file has no products.',
                      icon: Icons.inventory_2_outlined,
                    );
                  }
                  return _HomeContent(state: state);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _HomeContent extends StatelessWidget {
  final ProductsState state;

  const _HomeContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final catalog = state.catalog;
    void showAll() => Navigator.pushNamed(context, Routes.catalog);

    return WDiv(
      className: 'flex flex-col items-stretch overflow-y-auto',
      children: [
        WDiv(
          className: 'mt-[17px]',
          child: CategorySelector(
            categories: catalog.categories,
            selectedId: state.categoryId,
            onSelected: context.read<ProductsCubit>().selectCategory,
          ),
        ),
        if (catalog.heroBanner != null)
          WDiv(
            className: 'mt-[28px]',
            child: BannerCarousel(banner: catalog.heroBanner!),
          ),
        WDiv(
          className: 'mt-[34px]',
          child: FeatureProducts(
            products: state.inSection(ProductSection.featured),
            onShowAll: showAll,
          ),
        ),
        if (catalog.newCollection != null)
          WDiv(
            className: 'mt-[19.5px]',
            child: NewCollectionBanner(collection: catalog.newCollection!),
          ),
        WDiv(
          className: 'mt-[36.5px]',
          child: RecommendedSection(
            products: state.inSection(ProductSection.recommended),
            onShowAll: showAll,
          ),
        ),
        WDiv(
          className: 'mt-[24px] pb-[17.5px]',
          child: TopCollection(
            collections: catalog.topCollections,
            promos: catalog.categoryPromos,
            onShowAll: showAll,
          ),
        ),
      ],
    );
  }
}
