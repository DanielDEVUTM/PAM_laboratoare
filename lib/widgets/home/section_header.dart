import 'package:flutter/material.dart';

import '../../theme/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onShowAll;

  const SectionHeader({super.key, required this.title, this.onShowAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32, right: 33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(title, style: HomeTextStyles.sectionTitle),
          GestureDetector(
            onTap: onShowAll,
            child: const Text('Show all', style: HomeTextStyles.showAll),
          ),
        ],
      ),
    );
  }
}
