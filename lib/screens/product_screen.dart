import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(child: Text('Product')),
      ),
    );
  }
}
