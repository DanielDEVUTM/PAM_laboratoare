import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

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
    return WDiv(
      className: 'flex flex-row justify-between pl-[21px] pr-[18px]',
      children: [
        for (int i = 0; i < _categories.length; i++)
          _CategoryItem(
            label: _categories[i].$1,
            icon: _categories[i].$2,
            selected: i == _selected,
            onTap: () => setState(() => _selected = i),
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
