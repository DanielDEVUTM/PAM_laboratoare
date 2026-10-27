import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Rand de filtre: "All" + optiunile date ([value] null inseamna "All").
class FilterChips<T> extends StatelessWidget {
  final List<(T, String)> options;
  final T? selected;
  final ValueChanged<T?> onSelected;

  const FilterChips({
    super.key,
    required this.options,
    required this.selected,
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
            selected: selected == null,
            onTap: () => onSelected(null),
          ),
          for (final (value, label) in options)
            _Chip(
              label: label,
              selected: selected == value,
              onTap: () => onSelected(value),
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
