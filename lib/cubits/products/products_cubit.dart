import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/catalog.dart';
import '../../data/product_repository.dart';
import '../../models/product.dart';

part 'products_state.dart';

/// Incarca datele din JSON si aplica cautarea, filtrarea si sortarea.
class ProductsCubit extends Cubit<ProductsState> {
  final ProductRepository repository;

  ProductsCubit(this.repository) : super(const ProductsState());

  Future<void> load() async {
    emit(
      state.copyWith(status: ProductsStatus.loading, errorMessage: () => null),
    );
    try {
      final catalog = await repository.loadCatalog();
      String? selected;
      for (final category in catalog.categories) {
        if (category.selected) selected = category.id;
      }
      _emitFiltered(
        state.copyWith(catalog: catalog, categoryId: () => selected),
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

  void search(String query) => _emitFiltered(state.copyWith(query: query));

  /// [section] null afiseaza toate produsele.
  void filterBySection(ProductSection? section) =>
      _emitFiltered(state.copyWith(section: () => section));

  void sortBy(SortOption sort) => _emitFiltered(state.copyWith(sort: sort));

  void selectCategory(String categoryId) =>
      emit(state.copyWith(categoryId: () => categoryId));

  void clearFilters() => _emitFiltered(
    state.copyWith(
      query: '',
      section: () => null,
      sort: SortOption.recommended,
    ),
  );

  void _emitFiltered(ProductsState next) {
    final visible = _apply(next);
    emit(
      next.copyWith(
        visibleProducts: visible,
        status: visible.isEmpty ? ProductsStatus.empty : ProductsStatus.success,
      ),
    );
  }

  static List<Product> _apply(ProductsState s) {
    final query = s.query.trim().toLowerCase();
    final result = s.allProducts.where((p) {
      final matchesSection =
          s.section == null || p.sections.contains(s.section);
      final matchesQuery =
          query.isEmpty ||
          p.name.toLowerCase().contains(query) ||
          p.description.toLowerCase().contains(query);
      return matchesSection && matchesQuery;
    }).toList();

    int byName(Product a, Product b) =>
        a.name.toLowerCase().compareTo(b.name.toLowerCase());

    switch (s.sort) {
      case SortOption.recommended:
        break; // ordinea din JSON
      case SortOption.priceLowHigh:
        result.sort((a, b) => a.price.compareTo(b.price));
      case SortOption.priceHighLow:
        result.sort((a, b) => b.price.compareTo(a.price));
      case SortOption.nameAZ:
        result.sort(byName);
      case SortOption.nameZA:
        result.sort((a, b) => byName(b, a));
    }
    return result;
  }
}
