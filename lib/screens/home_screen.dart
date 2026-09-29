import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../widgets/home/category_selector.dart';
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
            ],
          ),
        ),
      ),
    );
  }
}
