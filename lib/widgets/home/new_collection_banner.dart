import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../data/design_images.dart';
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
        AppImage(
          DesignImages.of('newCollection', collection.imageUrl),
          height: 157,
        ),
        WDiv(
          className:
              'absolute top-[32px] left-[55px] flex flex-col items-start',
          children: [
            CollectionLabel(collection.label, size: 'text-[12px]'),
            WDiv(
              className: 'w-[115px]',
              child: WText(
                collection.title,
                className: 'mt-[17px] text-[21px] font-light leading-[25px] text-graphite',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
