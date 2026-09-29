import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../data/app_data.dart';

/// Alegerea culorii si a marimii.
class ProductOptions extends StatefulWidget {
  const ProductOptions({super.key});

  @override
  State<ProductOptions> createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  int _color = 0;
  int _size = 2;

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-row items-start',
      children: [
        WDiv(
          className: 'w-[197px] flex flex-col items-start',
          children: [
            const WText('Color', className: 'font-body text-[13.5px] text-dusk'),
            WDiv(
              className: 'flex flex-row items-center gap-[10px] mt-[11.5px] ml-[1px]',
              children: [
                for (int i = 0; i < AppData.productColors.length; i++)
                  WAnchor(
                    onTap: () => setState(() => _color = i),
                    child: _Swatch(
                      color: AppData.productColors[i],
                      selected: i == _color,
                    ),
                  ),
              ],
            ),
          ],
        ),
        WDiv(
          className: 'flex-1 flex flex-col items-start',
          children: [
            const WText('Size', className: 'font-body text-[13.5px] text-dusk'),
            WDiv(
              className: 'flex flex-row items-center gap-[7.5px] mt-[11.5px]',
              children: [
                for (int i = 0; i < AppData.productSizes.length; i++)
                  WAnchor(
                    onTap: () => setState(() => _size = i),
                    child: _SizeChip(
                      label: AppData.productSizes[i],
                      selected: i == _size,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _Swatch extends StatelessWidget {
  final String color;
  final bool selected;

  const _Swatch({required this.color, required this.selected});

  @override
  Widget build(BuildContext context) {
    final circle = WDiv(className: 'size-[24px] rounded-full bg-$color');
    if (!selected) return circle;

    return WDiv(
      className:
          'flex items-center justify-center size-[34px] rounded-full bg-white shadow-swatch',
      children: [circle],
    );
  }
}

class _SizeChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _SizeChip({required this.label, required this.selected});

  @override
  Widget build(BuildContext context) {
    final bg = selected ? 'bg-iron' : 'bg-pearl';
    final text = selected ? 'text-white' : 'text-smoke';

    return WDiv(
      className: 'flex items-center justify-center size-[33px] rounded-full $bg',
      children: [
        WText(label, className: 'font-mont text-[12.5px] font-semibold $text'),
      ],
    );
  }
}
