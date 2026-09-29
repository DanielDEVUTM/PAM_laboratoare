import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Center(child: Text('Home')),
      ),
    );
  }
}
