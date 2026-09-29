import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Bara fixa de jos cu butonul "Add To Cart".
class AddToCartBar extends StatelessWidget {
  final VoidCallback onTap;

  const AddToCartBar({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'bg-white',
      child: WAnchor(
        onTap: onTap,
        child: const WDiv(
          className:
              'flex flex-row items-start justify-center h-[77px] pt-[25px] bg-carbon rounded-t-3xl',
          children: [
            WIcon(Icons.shopping_bag, className: 'text-[24px] text-white'),
            WText(
              'Add To Cart',
              className: 'ml-[16px] mt-[4.5px] text-[16.5px] font-medium text-white',
            ),
          ],
        ),
      ),
    );
  }
}
