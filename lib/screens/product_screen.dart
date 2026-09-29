import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WDiv(
          className: 'flex items-center justify-center',
          children: [WText('Product', className: 'font-mont')],
        ),
      ),
    );
  }
}
