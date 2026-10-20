import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../cubits/products/products_cubit.dart';

class SortMenu extends StatelessWidget {
  final SortOption value;
  final ValueChanged<SortOption> onChanged;

  const SortMenu({super.key, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SortOption>(
      initialValue: value,
      onSelected: onChanged,
      color: Colors.white,
      itemBuilder: (context) => [
        for (final option in SortOption.values)
          PopupMenuItem(
            value: option,
            child: WText(
              option.label,
              className: option == value
                  ? 'text-[14px] font-medium text-brown'
                  : 'text-[14px] text-ink',
            ),
          ),
      ],
      child: WDiv(
        className: 'flex flex-row items-center',
        children: [
          const WIcon(Icons.sort, className: 'text-[18px] text-ink'),
          WText(value.label, className: 'ml-[6px] text-[13px] text-ink'),
          const WIcon(
            Icons.keyboard_arrow_down,
            className: 'text-[18px] text-ink',
          ),
        ],
      ),
    );
  }
}
