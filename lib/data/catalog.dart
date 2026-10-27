import '../models/category.dart';
import '../models/home_content.dart';
import '../models/product.dart';

/// Datele din fisierul JSON (`homePage` + `productPage`), dupa parsare.
class Catalog {
  final String storeName;
  final List<Category> categories;
  final HeroBanner? heroBanner;
  final Collection? newCollection;
  final List<Collection> topCollections;
  final List<CategoryPromo> categoryPromos;

  /// Toate produsele, fara duplicate: din Feature Products, Recommended si
  /// Similar Product. Produsul din `productPage` vine cu toate detaliile.
  final List<Product> products;

  const Catalog({
    this.storeName = '',
    this.categories = const [],
    this.heroBanner,
    this.newCollection,
    this.topCollections = const [],
    this.categoryPromos = const [],
    this.products = const [],
  });

  factory Catalog.fromJson(Map<String, dynamic> json) {
    final home = json['homePage'] as Map<String, dynamic>? ?? const {};
    final page = json['productPage'] as Map<String, dynamic>? ?? const {};
    final detailed = page['product'] == null
        ? null
        : Product.fromJson(page['product'] as Map<String, dynamic>);

    List<T> list<T>(
      Map<String, dynamic> source,
      String key,
      T Function(Map<String, dynamic>) parse,
    ) => (source[key] as List? ?? const [])
        .map((e) => parse(e as Map<String, dynamic>))
        .toList();

    // Produsele in ordinea din JSON; un produs care apare in mai multe
    // sectiuni pastreaza toate sectiunile.
    final byId = <String, Product>{};
    void add(Product product, ProductSection section) {
      final existing = byId[product.id];
      final base = product.id == detailed?.id ? detailed! : product;
      byId[product.id] = base.copyWith(
        sections: {...?existing?.sections, section},
      );
    }

    for (final p in list(home, 'featureProducts', Product.fromJson)) {
      add(p, ProductSection.featured);
    }
    for (final p in list(home, 'recommended', Product.fromJson)) {
      add(p, ProductSection.recommended);
    }
    for (final p in detailed?.similarProducts ?? const <Product>[]) {
      add(p, ProductSection.similar);
    }
    if (detailed != null && !byId.containsKey(detailed.id)) {
      byId[detailed.id] = detailed;
    }

    return Catalog(
      storeName: home['storeName'] as String? ?? '',
      categories: list(home, 'categories', Category.fromJson),
      heroBanner: home['heroBanner'] == null
          ? null
          : HeroBanner.fromJson(home['heroBanner'] as Map<String, dynamic>),
      newCollection: home['newCollection'] == null
          ? null
          : Collection.fromJson(home['newCollection'] as Map<String, dynamic>),
      topCollections: list(home, 'topCollections', Collection.fromJson),
      categoryPromos: list(home, 'categoryPromos', CategoryPromo.fromJson),
      products: byId.values.toList(),
    );
  }
}
