import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../widgets/home/banner_carousel.dart';
import '../widgets/home/category_selector.dart';
import '../widgets/home/feature_products.dart';
import '../widgets/home/home_header.dart';
import '../widgets/home/new_collection_banner.dart';
import '../widgets/home/recommended_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: WDiv(
          className: 'flex flex-col items-stretch overflow-y-auto',
          children: [
            HomeHeader(),
            WDiv(className: 'mt-[17px]', child: CategorySelector()),
            WDiv(className: 'mt-[28px]', child: BannerCarousel()),
            WDiv(className: 'mt-[34px]', child: FeatureProducts()),
            WDiv(className: 'mt-[19.5px]', child: NewCollectionBanner()),
            WDiv(className: 'mt-[36.5px]', child: RecommendedSection()),
          ],
        ),
      ),
    );
  }
}
