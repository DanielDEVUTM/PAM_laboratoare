import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/home/banner_carousel.dart';
import '../widgets/home/category_selector.dart';
import '../widgets/home/feature_products.dart';
import '../widgets/home/home_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HomeHeader(),
              SizedBox(height: 17),
              CategorySelector(),
              SizedBox(height: 28),
              BannerCarousel(),
              SizedBox(height: 34),
              FeatureProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
