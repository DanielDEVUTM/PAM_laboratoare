import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/product.dart';

/// Alegerea culorii si a marimii. Selectia initiala si marimile disponibile
/// vin din JSON (selectedColor, selectedSize, sizeAvailability).
class ProductOptions extends StatefulWidget {
  final Product product;

  const ProductOptions({super.key, required this.product});

  @override
  State<ProductOptions> createState() => _ProductOptionsState();
}

class _ProductOptionsState extends State<ProductOptions> {
  late String? _color =
      widget.product.selectedColor ??
      (widget.product.colors.isEmpty ? null : widget.product.colors.first.id);
  late String? _size = widget.product.selectedSize;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return WDiv(
      className: 'flex flex-row items-start',
      children: [
        if (product.colors.isNotEmpty)
          WDiv(
            className: 'w-[197px] flex flex-col items-start',
            children: [
              const WText(
                'Color',
                className: 'font-body text-[13.5px] text-dusk',
              ),
              WDiv(
                className: 'flex flex-row items-center gap-[10px] mt-[11.5px] ml-[1px]',
                children: [
                  for (final color in product.colors)
                    WAnchor(
                      onTap: () => setState(() => _color = color.id),
                      child: _Swatch(
                        color: color.color,
                        selected: color.id == _color,
                      ),
                    ),
                ],
              ),
            ],
          ),
        if (product.sizes.isNotEmpty)
          WDiv(
            className: 'flex-1 flex flex-col items-start',
            children: [
              const WText(
                'Size',
                className: 'font-body text-[13.5px] text-dusk',
              ),
              WDiv(
                className: 'flex flex-row items-center gap-[7.5px] mt-[11.5px]',
                children: [
                  for (final size in product.sizes)
                    WAnchor(
                      // marimile indisponibile nu se pot alege
                      onTap: product.isSizeAvailable(size)
                          ? () => setState(() => _size = size)
                          : null,
                      child: _SizeChip(label: size, selected: size == _size),
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
  final Color color;
  final bool selected;

  const _Swatch({required this.color, required this.selected});

  @override
  Widget build(BuildContext context) {
    final circle = Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
    if (!selected) return circle;

    return WDiv(
      className: 'flex items-center justify-center size-[34px] rounded-full bg-white shadow-swatch',
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
      className:
          'flex items-center justify-center size-[33px] rounded-full $bg',
      children: [
        WText(label, className: 'font-mont text-[12.5px] font-semibold $text'),
      ],
    );
  }
}
