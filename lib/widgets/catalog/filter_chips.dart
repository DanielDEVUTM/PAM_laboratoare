import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/category.dart';

/// Filtrul pe categorii: "All" + categoriile din JSON.
class CategoryChips extends StatelessWidget {
  final List<Category> categories;
  final String? selectedId;
  final ValueChanged<String?> onSelected;

  const CategoryChips({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'overflow-x-auto',
      child: WDiv(
        className: 'flex flex-row items-center gap-[8px] px-[24px]',
        children: [
          _Chip(
            label: 'All',
            selected: selectedId == null,
            onTap: () => onSelected(null),
          ),
          for (final category in categories)
            _Chip(
              label: category.name,
              selected: selectedId == category.id,
              onTap: () => onSelected(category.id),
            ),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _Chip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bg = selected ? 'bg-brown border-brown' : 'bg-white border-divider';
    final text = selected ? 'text-white' : 'text-pebble';

    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className: 'px-[18px] py-[8px] rounded-full border $bg',
        child: WText(label, className: 'text-[13px] font-medium $text'),
      ),
    );
  }
}
