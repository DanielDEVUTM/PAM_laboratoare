part of 'products_cubit.dart';

enum ProductsStatus { loading, success, empty, error }

enum SortOption {
  recommended('Recommended'),
  priceLowHigh('Price: low to high'),
  priceHighLow('Price: high to low'),
  nameAZ('Name A-Z'),
  nameZA('Name Z-A');

  final String label;
  const SortOption(this.label);
}

class ProductsState extends Equatable {
  final ProductsStatus status;

  /// Toate datele din JSON.
  final Catalog catalog;

  /// Produsele dupa cautare, filtrare si sortare.
  final List<Product> visibleProducts;
  final String query;

  /// Filtrul pe sectiuni; null inseamna toate produsele.
  final ProductSection? section;
  final SortOption sort;

  /// Categoria selectata pe Home (initial cea cu "selected": true in JSON).
  final String? categoryId;
  final String? errorMessage;

  const ProductsState({
    this.status = ProductsStatus.loading,
    this.catalog = const Catalog(),
    this.visibleProducts = const [],
    this.query = '',
    this.section,
    this.sort = SortOption.recommended,
    this.categoryId,
    this.errorMessage,
  });

  List<Product> get allProducts => catalog.products;

  List<Product> inSection(ProductSection section) =>
      allProducts.where((p) => p.sections.contains(section)).toList();

  bool get hasFilters => query.trim().isNotEmpty || section != null;

  /// Produsele marcate favorite in JSON ("isFavorite": true).
  Set<String> get initialFavorites => {
    for (final p in allProducts)
      if (p.isFavorite) p.id,
  };

  Product? productById(String id) {
    for (final product in allProducts) {
      if (product.id == id) return product;
    }
    return null;
  }

  ProductsState copyWith({
    ProductsStatus? status,
    Catalog? catalog,
    List<Product>? visibleProducts,
    String? query,
    ProductSection? Function()? section,
    SortOption? sort,
    String? Function()? categoryId,
    String? Function()? errorMessage,
  }) {
    return ProductsState(
      status: status ?? this.status,
      catalog: catalog ?? this.catalog,
      visibleProducts: visibleProducts ?? this.visibleProducts,
      query: query ?? this.query,
      section: section != null ? section() : this.section,
      sort: sort ?? this.sort,
      categoryId: categoryId != null ? categoryId() : this.categoryId,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    catalog,
    visibleProducts,
    query,
    section,
    sort,
    categoryId,
    errorMessage,
  ];
}
