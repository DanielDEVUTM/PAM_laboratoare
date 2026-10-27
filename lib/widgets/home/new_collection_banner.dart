import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/home_content.dart';
import '../common/app_image.dart';
import 'collection_label.dart';

class NewCollectionBanner extends StatelessWidget {
  final Collection collection;

  const NewCollectionBanner({super.key, required this.collection});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'relative w-full h-[157px] bg-snow',
      children: [
        AppImage(collection.imageUrl, height: 157),
        const WDiv(
          className: 'absolute top-0 bottom-0 left-0 right-0',
          child: _LightFade(),
        ),
        WDiv(
          className: 'absolute top-[32px] left-[55px] w-[150px] flex flex-col items-start',
          children: [
            CollectionLabel(collection.label, size: 'text-[12px]'),
            WText(
              collection.title,
              className: 'mt-[17px] text-[21px] font-light leading-[25px] text-graphite',
            ),
          ],
        ),
      ],
    );
  }
}

/// Fundal deschis in stanga, ca textul inchis sa se citeasca peste poza.
class _LightFade extends StatelessWidget {
  const _LightFade();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xEEF8F8FA), Color(0x00F8F8FA)],
          stops: [0.45, 0.8],
        ),
      ),
      child: SizedBox.expand(),
    );
  }
}
