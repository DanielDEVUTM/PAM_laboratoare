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

Product product(
  String id,
  String name,
  String category,
  double price, {
  double rating = 4,
  String date = '2026-01-01',
}) => Product(
  id: id,
  name: name,
  category: category,
  price: price,
  image: '',
  rating: rating,
  createdAt: DateTime.parse(date),
);

final catalog = Catalog(
  categories: const [],
  products: [
    product('1', 'Cotton T-shirt', 'men', 30, rating: 4.5, date: '2026-03-01'),
    product(
      '2',
      'Evening Dress',
      'women',
      120,
      rating: 4.9,
      date: '2026-01-01',
    ),
    product(
      '3',
      'Straw Hat',
      'accessories',
      19.9,
      rating: 3.9,
      date: '2026-05-01',
    ),
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
      build: () => ProductsCubit(
        FakeRepository(() async => const Catalog(categories: [], products: [])),
      ),
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

      cubit.search('dress');
      expect(ids(cubit.state), ['2']);

      cubit.search('');
      cubit.selectCategory('men');
      expect(ids(cubit.state), ['1']);

      cubit.selectCategory(null);
      cubit.sortBy(SortOption.priceLowHigh);
      expect(ids(cubit.state), ['3', '1', '2']);

      cubit.sortBy(SortOption.priceHighLow);
      expect(ids(cubit.state), ['2', '1', '3']);

      cubit.sortBy(SortOption.rating);
      expect(ids(cubit.state), ['2', '1', '3']);

      cubit.sortBy(SortOption.newest);
      expect(ids(cubit.state), ['3', '1', '2']);

      cubit.search('nothing matches');
      expect(cubit.state.status, ProductsStatus.empty);

      cubit.clearFilters();
      expect(cubit.state.status, ProductsStatus.success);
      expect(cubit.state.visibleProducts.length, 3);

      await cubit.close();
    });
  });

  test('ProductRepository citeste fisierul JSON din assets', () async {
    final data = await ProductRepository(delay: Duration.zero).loadCatalog();
    expect(data.categories, isNotEmpty);
    expect(data.products, isNotEmpty);
    expect(data.products.every((p) => p.id.isNotEmpty), isTrue);
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
  });
}
