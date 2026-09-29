import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Eticheta cu bara verticala din fata: "| NEW COLLECTION", "| Sale up to 40%".
class CollectionLabel extends StatelessWidget {
  final String text;
  final String size;

  const CollectionLabel(this.text, {super.key, this.size = 'text-[11px]'});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-row items-center',
      children: [
        const WDiv(className: 'w-[1px] h-[12px] bg-dusk'),
        WText(text, className: 'ml-[8px] $size font-light text-dusk'),
      ],
    );
  }
}
