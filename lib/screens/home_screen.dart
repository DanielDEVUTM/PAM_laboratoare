import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../cubits/products/products_cubit.dart';
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
            const HomeHeader(),
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
                      message: 'The catalog is empty.',
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

  void _openCategory(BuildContext context, String categoryId) {
    context.read<ProductsCubit>().selectCategory(categoryId);
    Navigator.pushNamed(context, Routes.catalog);
  }

  @override
  Widget build(BuildContext context) {
    void showAll() => Navigator.pushNamed(context, Routes.catalog);

    return WDiv(
      className: 'flex flex-col items-stretch overflow-y-auto',
      children: [
        WDiv(
          className: 'mt-[17px]',
          child: CategorySelector(
            categories: state.categories,
            selectedId: state.categoryId,
            onSelected: (id) => _openCategory(context, id),
          ),
        ),
        const WDiv(className: 'mt-[28px]', child: BannerCarousel()),
        WDiv(
          className: 'mt-[34px]',
          child: FeatureProducts(products: state.featured, onShowAll: showAll),
        ),
        const WDiv(className: 'mt-[19.5px]', child: NewCollectionBanner()),
        WDiv(
          className: 'mt-[36.5px]',
          child: RecommendedSection(
            products: state.recommended,
            onShowAll: showAll,
          ),
        ),
        WDiv(
          className: 'mt-[24px] pb-[17.5px]',
          child: TopCollection(onShowAll: showAll),
        ),
      ],
    );
  }
}
