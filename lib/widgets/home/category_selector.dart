import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  static const List<(String, String)> _categories = [
    ('Women', 'assets/icons/women.png'),
    ('Men', 'assets/icons/men.png'),
    ('Accessories', 'assets/icons/accessories.png'),
    ('Beauty', 'assets/icons/beauty.png'),
  ];

  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21, right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < _categories.length; i++)
            _CategoryItem(
              label: _categories[i].$1,
              icon: _categories[i].$2,
              selected: i == _selected,
              onTap: () => setState(() => _selected = i),
            ),
        ],
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String label;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  const _CategoryItem({
    required this.label,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 70,
        child: Column(
          children: [
            Container(
              width: 42,
              height: 42,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected ? AppColors.brown : Colors.transparent,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selected
                      ? AppColors.brown
                      : AppColors.categoryBackground,
                ),
                alignment: Alignment.center,
                child: Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: selected
                      ? AppColors.white
                      : AppColors.categoryInactive,
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text(
              label,
              style: HomeTextStyles.category.copyWith(
                color: selected
                    ? AppColors.brown
                    : AppColors.categoryInactive,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
