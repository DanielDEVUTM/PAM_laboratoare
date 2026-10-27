import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/home_content.dart';
import '../common/app_image.dart';
import 'collection_label.dart';
import 'section_header.dart';

class TopCollection extends StatelessWidget {
  final List<Collection> collections;
  final List<CategoryPromo> promos;
  final VoidCallback? onShowAll;

  const TopCollection({
    super.key,
    required this.collections,
    required this.promos,
    this.onShowAll,
  });

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        SectionHeader(title: 'Top Collection', onShowAll: onShowAll),
        WDiv(
          className: 'flex flex-col items-stretch mt-[29.5px] px-[32px]',
          children: [
            for (int i = 0; i < collections.length; i++)
              WDiv(
                className: i == 0 ? '' : 'mt-[15px]',
                child: _CollectionCard(
                  image: collections[i].imageUrl,
                  // primul card e mai mic si cu titlu subtire, al doilea
                  // e mai inalt si cu titlu ingrosat (ca in macheta)
                  height: i.isEven ? 141 : 210,
                  textClassName: i.isEven
                      ? 'top-[20px] left-[23px] w-[150px]'
                      : 'top-[32.5px] left-[23px] w-[150px]',
                  children: [
                    CollectionLabel(collections[i].label),
                    WText(
                      collections[i].title,
                      className: i.isEven
                          ? 'mt-[23px] text-[19px] font-light leading-[24px] text-dusk'
                          : 'mt-[23px] text-[18px] font-bold leading-[30px] text-graphite',
                    ),
                  ],
                ),
              ),
            if (promos.isNotEmpty)
              WDiv(
                className: 'flex flex-row gap-[10px] mt-[16px]',
                children: [
                  for (final promo in promos)
                    WDiv(
                      className: 'flex-1',
                      child: _CollectionCard(
                        image: promo.imageUrl,
                        height: 194,
                        textClassName: 'top-[40px] left-[12px] w-[80px]',
                        children: [
                          WText(
                            promo.category,
                            className: 'text-[12.5px] text-steel',
                          ),
                          WText(
                            promo.title,
                            className: 'mt-[14px] text-[16px] font-light leading-[21px] text-ink',
                          ),
                        ],
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

/// Card cu poza de fundal si text suprapus in stanga.
class _CollectionCard extends StatelessWidget {
  final String image;
  final double height;
  final String textClassName;
  final List<Widget> children;

  const _CollectionCard({
    required this.image,
    required this.height,
    required this.textClassName,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final h = 'h-[${height}px]';

    return WDiv(
      className: 'relative w-full $h rounded-xl overflow-hidden bg-snow',
      children: [
        AppImage(image, height: height, alignment: Alignment.centerRight),
        const WDiv(
          className: 'absolute top-0 bottom-0 left-0 right-0',
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xE6F8F8FA), Color(0x00F8F8FA)],
                stops: [0.35, 0.75],
              ),
            ),
            child: SizedBox.expand(),
          ),
        ),
        WDiv(
          className: 'absolute $textClassName flex flex-col items-start',
          children: children,
        ),
      ],
    );
  }
}
