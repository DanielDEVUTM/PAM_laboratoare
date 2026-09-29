import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import 'collection_label.dart';

class NewCollectionBanner extends StatelessWidget {
  const NewCollectionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return const WDiv(
      className: 'relative w-full h-[157px] bg-snow',
      children: [
        WImage(
          src: 'asset://assets/images/new_collection.jpg',
          className: 'w-full h-[157px] object-cover',
        ),
        WDiv(
          className: 'absolute top-[32px] left-[55px] flex flex-col items-start',
          children: [
            CollectionLabel('NEW COLLECTION', size: 'text-[12px]'),
            WText(
              'HANG OUT\n& PARTY',
              className:
                  'mt-[17px] text-[21px] font-light leading-[25px] text-graphite',
            ),
          ],
        ),
      ],
    );
  }
}
