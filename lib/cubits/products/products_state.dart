part of 'products_cubit.dart';

enum ProductsStatus { loading, success, empty, error }

enum SortOption {
  popular('Popular'),
  newest('Newest'),
  priceLowHigh('Price: low to high'),
  priceHighLow('Price: high to low'),
  rating('Top rated'),
  name('Name A-Z');

  final String label;
  const SortOption(this.label);
}

class ProductsState extends Equatable {
  final ProductsStatus status;
  final List<Category> categories;

  /// Toate produsele din JSON.
  final List<Product> allProducts;

  /// Produsele dupa cautare, filtrare si sortare.
  final List<Product> visibleProducts;
  final String query;

  /// null inseamna toate categoriile.
  final String? categoryId;
  final SortOption sort;
  final String? errorMessage;

  const ProductsState({
    this.status = ProductsStatus.loading,
    this.categories = const [],
    this.allProducts = const [],
    this.visibleProducts = const [],
    this.query = '',
    this.categoryId,
    this.sort = SortOption.popular,
    this.errorMessage,
  });

  List<Product> get featured =>
      allProducts.where((p) => p.isFeatured).toList();

  List<Product> get recommended =>
      allProducts.where((p) => p.isRecommended).toList();

  bool get hasFilters => query.isNotEmpty || categoryId != null;

  Product? productById(String id) {
    for (final product in allProducts) {
      if (product.id == id) return product;
    }
    return null;
  }

  /// Produse din aceeasi categorie, fara produsul curent.
  List<Product> similarTo(Product product) => allProducts
      .where((p) => p.category == product.category && p.id != product.id)
      .toList();

  ProductsState copyWith({
    ProductsStatus? status,
    List<Category>? categories,
    List<Product>? allProducts,
    List<Product>? visibleProducts,
    String? query,
    String? Function()? categoryId,
    SortOption? sort,
    String? Function()? errorMessage,
  }) {
    return ProductsState(
      status: status ?? this.status,
      categories: categories ?? this.categories,
      allProducts: allProducts ?? this.allProducts,
      visibleProducts: visibleProducts ?? this.visibleProducts,
      query: query ?? this.query,
      categoryId: categoryId != null ? categoryId() : this.categoryId,
      sort: sort ?? this.sort,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    status,
    categories,
    allProducts,
    visibleProducts,
    query,
    categoryId,
    sort,
    errorMessage,
  ];
}
