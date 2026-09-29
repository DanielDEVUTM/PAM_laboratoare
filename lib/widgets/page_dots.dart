import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Indicatorul de pagini din bannere: pagina curenta e un inel cu punct.
class PageDots extends StatelessWidget {
  final int count;
  final int current;

  /// Culoarea din tema Wind, de ex. 'white' sau 'dim'.
  final String color;

  const PageDots({
    super.key,
    required this.count,
    required this.current,
    this.color = 'white',
  });

  @override
  Widget build(BuildContext context) {
    final dot = WDiv(className: 'size-[4px] rounded-full bg-$color');

    return WDiv(
      className: 'flex flex-row items-center justify-center',
      children: [
        for (int i = 0; i < count; i++)
          WDiv(
            className: i == 0 ? '' : (i == 1 ? 'ml-[11px]' : 'ml-[11.5px]'),
            child: i == current
                ? WDiv(
                    className:
                        'flex items-center justify-center size-[10.5px] rounded-full border border-$color',
                    children: [dot],
                  )
                : dot,
          ),
      ],
    );
  }
}
