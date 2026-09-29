import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onShowAll;

  const SectionHeader({super.key, required this.title, this.onShowAll});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-row items-center justify-between pl-[32px] pr-[33px]',
      children: [
        WDiv(
          className: 'flex-1',
          child: WText(title, className: 'text-[21px] font-medium text-black'),
        ),
        WAnchor(
          onTap: onShowAll,
          child: const WText('Show all', className: 'text-[14px] text-muted'),
        ),
      ],
    );
  }
}
