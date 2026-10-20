import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String home = '/';
  static const String catalog = '/catalog';
  static const String favorites = '/favorites';
  static const String product = '/product';

  /// Deschide pagina de detalii; id-ul produsului e trimis ca argument.
  static Future<void> openProduct(BuildContext context, String productId) =>
      Navigator.pushNamed(context, product, arguments: productId);
}
