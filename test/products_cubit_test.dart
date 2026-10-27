import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laborator2/cubits/favorites/favorites_cubit.dart';
import 'package:laborator2/cubits/products/products_cubit.dart';
import 'package:laborator2/data/catalog.dart';
import 'package:laborator2/data/product_repository.dart';
import 'package:laborator2/models/product.dart';

class FakeRepository extends ProductRepository {
  final Future<Catalog> Function() onLoad;

  FakeRepository(this.onLoad);

  @override
  Future<Catalog> loadCatalog() => onLoad();
}

Product product(String id, String name, double price, ProductSection section) =>
    Product(
      id: id,
      name: name,
      price: price,
      imageUrl: '',
      sections: {section},
    );

final catalog = Catalog(
  products: [
    product('1', 'Turtleneck Sweater', 39.99, ProductSection.featured),
    product('2', 'Cotton T-shirt', 30, ProductSection.recommended),
    product('3', 'Sport Sweatshirt', 47.99, ProductSection.similar),
  ],
);

List<String> ids(ProductsState s) =>
    s.visibleProducts.map((p) => p.id).toList();

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('ProductsCubit', () {
    blocTest<ProductsCubit, ProductsState>(
      'emite Loading apoi Success cu produsele',
      build: () => ProductsCubit(FakeRepository(() async => catalog)),
      act: (cubit) => cubit.load(),
      expect: () => [
        isA<ProductsState>().having(
          (s) => s.status,
          'status',
          ProductsStatus.loading,
        ),
        isA<ProductsState>()
            .having((s) => s.status, 'status', ProductsStatus.success)
            .having((s) => s.allProducts.length, 'products', 3),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      'emite Empty cand JSON-ul nu are produse',
      build: () => ProductsCubit(FakeRepository(() async => const Catalog())),
      act: (cubit) => cubit.load(),
      skip: 1,
      expect: () => [
        isA<ProductsState>().having(
          (s) => s.status,
          'status',
          ProductsStatus.empty,
        ),
      ],
    );

    blocTest<ProductsCubit, ProductsState>(
      'emite Error cand incarcarea esueaza',
      build: () =>
          ProductsCubit(FakeRepository(() async => throw Exception('x'))),
      act: (cubit) => cubit.load(),
      skip: 1,
      expect: () => [
        isA<ProductsState>()
            .having((s) => s.status, 'status', ProductsStatus.error)
            .having((s) => s.errorMessage, 'message', isNotNull),
      ],
    );

    test('cautare, filtrare si sortare', () async {
      final cubit = ProductsCubit(FakeRepository(() async => catalog));
      await cubit.load();

      cubit.search('sweat');
      expect(ids(cubit.state), ['1', '3']);

      cubit.search('');
      cubit.filterBySection(ProductSection.recommended);
      expect(ids(cubit.state), ['2']);

      cubit.filterBySection(null);
      cubit.sortBy(SortOption.priceLowHigh);
      expect(ids(cubit.state), ['2', '1', '3']);

      cubit.sortBy(SortOption.priceHighLow);
      expect(ids(cubit.state), ['3', '1', '2']);

      cubit.sortBy(SortOption.nameAZ);
      expect(ids(cubit.state), ['2', '3', '1']);

      cubit.sortBy(SortOption.nameZA);
      expect(ids(cubit.state), ['1', '3', '2']);

      cubit.search('nothing matches');
      expect(cubit.state.status, ProductsStatus.empty);

      cubit.clearFilters();
      expect(cubit.state.status, ProductsStatus.success);
      expect(ids(cubit.state), ['1', '2', '3']);

      await cubit.close();
    });
  });

  test('ProductRepository citeste lab_v1.json din assets', () async {
    final data = await ProductRepository(delay: Duration.zero).loadCatalog();

    expect(data.storeName, 'GemStore');
    expect(data.categories.map((c) => c.id), [
      'women',
      'men',
      'accessories',
      'beauty',
    ]);
    expect(data.heroBanner?.slides, 3);
    expect(data.topCollections.length, 2);
    expect(data.categoryPromos.length, 2);

    // p001..p008, fara duplicate (p003 apare si in productPage)
    expect(data.products.map((p) => p.id), [
      'p001',
      'p002',
      'p003',
      'p004',
      'p005',
      'p006',
      'p007',
      'p008',
    ]);

    final sportwear = data.products.firstWhere((p) => p.id == 'p003');
    expect(sportwear.hasDetails, isTrue);
    expect(sportwear.sections, {ProductSection.featured});
    expect(sportwear.images.length, 2);
    expect(sportwear.colors.map((c) => c.id), ['beige', 'black', 'coral']);
    expect(sportwear.isSizeAvailable('S'), isFalse);
    expect(sportwear.isSizeAvailable('L'), isTrue);
    expect(sportwear.reviews.length, 2);
    expect(sportwear.similarProducts.length, 3);
    expect(sportwear.isFavorite, isTrue);
    expect(sportwear.formattedPrice, '\$ 80.00');
  });

  test('FavoritesCubit adauga si elimina', () {
    final cubit = FavoritesCubit();
    cubit.toggle('1');
    expect(cubit.state, {'1'});
    cubit.toggle('2');
    cubit.toggle('1');
    expect(cubit.state, {'2'});
    cubit.remove('2');
    expect(cubit.state, isEmpty);
    cubit.addAll({'p003'});
    expect(cubit.state, {'p003'});
  });
}
