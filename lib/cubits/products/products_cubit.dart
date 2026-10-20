import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/product_repository.dart';
import '../../models/category.dart';
import '../../models/product.dart';

part 'products_state.dart';

/// Incarca produsele din JSON si aplica cautarea, filtrarea si sortarea.
class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository repository;

  ProductsCubit(this.repository) : super(const ProductsState());

  Future<void> load() async {
    emit(state.copyWith(status: ProductsStatus.loading, errorMessage: () => null));
    try {
      final catalog = await repository.loadCatalog();
      _emitFiltered(
        state.copyWith(
          categories: catalog.categories,
          allProducts: catalog.products,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductsStatus.error,
          errorMessage: () => 'Nu s-au putut incarca produsele.\n$e',
        ),
      );
    }
  }

  void search(String query) =>
      _emitFiltered(state.copyWith(query: query.trim()));

  /// [categoryId] null afiseaza toate categoriile.
  void selectCategory(String? categoryId) =>
      _emitFiltered(state.copyWith(categoryId: () => categoryId));

  void sortBy(SortOption sort) => _emitFiltered(state.copyWith(sort: sort));

  void clearFilters() => _emitFiltered(
    state.copyWith(query: '', categoryId: () => null, sort: SortOption.popular),
  );

  void _emitFiltered(ProductsState next) {
    if (next.status == ProductsStatus.error) {
      emit(next);
      return;
    }
    final visible = _apply(next);
    emit(
      next.copyWith(
        visibleProducts: visible,
        status: visible.isEmpty ? ProductsStatus.empty : ProductsStatus.success,
      ),
    );
  }

  static List<Product> _apply(ProductsState s) {
    final query = s.query.toLowerCase();
    final result = s.allProducts.where((p) {
      final matchesCategory = s.categoryId == null || p.category == s.categoryId;
      final matchesQuery =
          query.isEmpty ||
          p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    }).toList();

    switch (s.sort) {
      case SortOption.popular:
        result.sort((a, b) => b.ratingsCount.compareTo(a.ratingsCount));
      case SortOption.newest:
        result.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      case SortOption.priceLowHigh:
        result.sort((a, b) => a.price.compareTo(b.price));
      case SortOption.priceHighLow:
        result.sort((a, b) => b.price.compareTo(a.price));
      case SortOption.rating:
        result.sort((a, b) => b.rating.compareTo(a.rating));
      case SortOption.name:
        result.sort(
          (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
        );
    }
    return result;
  }
}
