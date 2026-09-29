import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import 'screens/home_screen.dart';
import 'screens/product_screen.dart';
import 'theme/wind_theme.dart';

void main() {
  runApp(const GemStoreApp());
}

class GemStoreApp extends StatelessWidget {
  const GemStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: WindTheme(
        data: appWindTheme,
        builder: (context, controller) => MaterialApp(
          title: 'GemStore',
          debugShowCheckedModeBanner: false,
          theme: controller.toThemeData(),
          initialRoute: '/',
          routes: {
            '/': (context) => const HomeScreen(),
            '/product': (context) => const ProductScreen(),
          },
        ),
      ),
    );
  }
}
