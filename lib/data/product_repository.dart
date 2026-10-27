import 'dart:convert';

import 'package:flutter/services.dart';

import 'catalog.dart';

/// Sursa de date a aplicatiei: citeste asincron fisierul JSON din assets.
class ProductRepository {
  static const String defaultPath = 'assets/data/lab_v1.json';

  final AssetBundle bundle;
  final String path;

  /// Intarziere artificiala, ca starea Loading sa fie vizibila (ca la un API).
  final Duration delay;

  ProductRepository({
    AssetBundle? bundle,
    this.path = defaultPath,
    this.delay = const Duration(milliseconds: 800),
  }) : bundle = bundle ?? rootBundle;

  Future<Catalog> loadCatalog() async {
    await Future<void>.delayed(delay);
    final raw = await bundle.loadString(path, cache: false);
    final json = jsonDecode(raw) as Map<String, dynamic>;
    return Catalog.fromJson(json);
  }
}
