import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/category.dart';

/// Categoriile din JSON; cea selectata vine din campul "selected".
class CategorySelector extends StatelessWidget {
  final List<Category> categories;
  final String? selectedId;
  final ValueChanged<String> onSelected;

  const CategorySelector({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-row justify-between pl-[21px] pr-[18px]',
      children: [
        for (final category in categories)
          _CategoryItem(
            label: category.name,
            icon: category.iconAsset,
            selected: category.id == selectedId,
            onTap: () => onSelected(category.id),
          ),
      ],
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
    final ring = selected ? 'border-brown' : 'border-transparent';
    final circle = selected ? 'bg-brown' : 'bg-mist';
    final text = selected ? 'text-brown' : 'text-pebble';

    return WAnchor(
      onTap: onTap,
      child: WDiv(
        className: 'flex flex-col items-center w-[70px]',
        children: [
          WDiv(
            className: 'size-[42px] p-[2px] rounded-full border $ring',
            child: WDiv(
              className:
                  'flex items-center justify-center size-[36px] rounded-full $circle',
              children: [
                Image.asset(
                  icon,
                  width: 20,
                  height: 20,
                  color: selected ? Colors.white : context.wColorExt('pebble'),
                ),
              ],
            ),
          ),
          WText(label, className: 'mt-[6px] text-[9.5px] $text'),
        ],
      ),
    );
  }
}
