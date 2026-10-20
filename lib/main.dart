import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import 'cubits/favorites/favorites_cubit.dart';
import 'cubits/products/products_cubit.dart';
import 'data/product_repository.dart';
import 'routes.dart';
import 'screens/catalog_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/home_screen.dart';
import 'screens/product_screen.dart';
import 'theme/wind_theme.dart';

void main() {
  runApp(GemStoreApp(repository: ProductRepository()));
}

class GemStoreApp extends StatelessWidget {
  final ProductRepository repository;

  const GemStoreApp({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: repository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ProductsCubit(repository)..load()),
          BlocProvider(create: (_) => FavoritesCubit()),
        ],
        child: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark,
          child: WindTheme(
            data: appWindTheme,
            builder: (context, controller) => MaterialApp(
              title: 'GemStore',
              debugShowCheckedModeBanner: false,
              theme: controller.toThemeData(),
              initialRoute: Routes.home,
              onGenerateRoute: _onGenerateRoute,
            ),
          ),
        ),
      ),
    );
  }

  static Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    final Widget page = switch (settings.name) {
      Routes.catalog => const CatalogScreen(),
      Routes.favorites => const FavoritesScreen(),
      Routes.product => ProductScreen(productId: settings.arguments as String),
      _ => const HomeScreen(),
    };
    return MaterialPageRoute(builder: (_) => page, settings: settings);
  }
}
