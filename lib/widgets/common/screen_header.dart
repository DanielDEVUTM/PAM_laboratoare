import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

/// Header simplu: inapoi, titlu si o actiune optionala in dreapta.
class ScreenHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const ScreenHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className:
          'flex flex-row items-center justify-between h-[64px] px-[24px]',
      children: [
        WAnchor(
          onTap: () => Navigator.maybePop(context),
          child: const WDiv(
            className: 'size-[28px] flex items-center justify-start',
            children: [
              WIcon(
                Icons.arrow_back_ios_new,
                className: 'text-[18px] text-ink',
              ),
            ],
          ),
        ),
        WText(title, className: 'text-[19px] font-bold text-black'),
        WDiv(className: 'w-[28px]', child: trailing ?? const SizedBox()),
      ],
    );
  }
}
