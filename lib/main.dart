import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'screens/home_screen.dart';
import 'screens/product_screen.dart';
import 'theme/app_colors.dart';
import 'theme/app_text_styles.dart';

void main() {
  runApp(const GemStoreApp());
}

class GemStoreApp extends StatelessWidget {
  const GemStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MaterialApp(
        title: 'GemStore',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: AppFonts.googleSans,
          scaffoldBackgroundColor: AppColors.white,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.brown),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomeScreen(),
          '/product': (context) => const ProductScreen(),
        },
      ),
    );
  }
}
