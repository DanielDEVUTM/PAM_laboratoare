import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laborator2/data/catalog.dart';
import 'package:laborator2/data/product_repository.dart';
import 'package:laborator2/main.dart';

import 'test_fonts.dart';

class FailingRepository extends ProductRepository {
  @override
  Future<Catalog> loadCatalog() async => throw Exception('no file');
}

void main() {
  setUpAll(loadAppFonts);

  testWidgets('Home: Loading, apoi produsele din JSON si pagina de detalii', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      GemStoreApp(repository: ProductRepository(delay: Duration.zero)),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 200)),
    );
    await tester.pumpAndSettle();

    expect(find.text('GemStore'), findsOneWidget);
    expect(find.text('Feature Products'), findsOneWidget);
    expect(find.text('Turtleneck Sweater'), findsOneWidget);

    await tester.tap(find.text('Sportwear Set'));
    await tester.pumpAndSettle();
    expect(find.text('Add To Cart'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('Reviews'), findsOneWidget);
    expect(find.text('Jennifer Rose'), findsOneWidget);
    expect(find.text('Similar Product'), findsOneWidget);
  });

  testWidgets('Discover: cautare fara rezultate afiseaza starea Empty', (
    tester,
  ) async {
    await tester.binding.setSurfaceSize(const Size(390, 844));
    await tester.pumpWidget(
      GemStoreApp(repository: ProductRepository(delay: Duration.zero)),
    );
    await tester.runAsync(
      () => Future<void>.delayed(const Duration(milliseconds: 200)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('Show all').first);
    await tester.pumpAndSettle();
    expect(find.text('Discover'), findsOneWidget);
    // p003 e favorit din JSON ("isFavorite": true)
    expect(find.text('1'), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'zzzz');
    await tester.pumpAndSettle();
    expect(find.text('No results'), findsOneWidget);

    await tester.tap(find.text('Clear filters'));
    await tester.pumpAndSettle();
    expect(find.text('No results'), findsNothing);
    expect(find.text('zzzz'), findsNothing);
  });

  testWidgets('Error: afiseaza mesajul si butonul Try again', (tester) async {
    await tester.pumpWidget(GemStoreApp(repository: FailingRepository()));
    await tester.pumpAndSettle();

    expect(find.text('Something went wrong'), findsOneWidget);
    expect(find.text('Try again'), findsOneWidget);
  });
}
