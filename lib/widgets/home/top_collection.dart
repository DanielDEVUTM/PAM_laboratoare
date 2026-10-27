import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../data/design_images.dart';
import '../../models/home_content.dart';
import '../common/app_image.dart';
import 'collection_label.dart';
import 'section_header.dart';

/// Textele vin din JSON; latimea blocurilor de text face ca randurile sa se
/// rupa exact ca in macheta (de ex. "FOR SLIM / & BEAUTY").
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
    final sale = collections.isNotEmpty ? collections[0] : null;
    final summer = collections.length > 1 ? collections[1] : null;
    final tShirts = promos.isNotEmpty ? promos[0] : null;
    final dresses = promos.length > 1 ? promos[1] : null;

    return WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        SectionHeader(title: 'Top Collection', onShowAll: onShowAll),
        WDiv(
          className: 'flex flex-col items-stretch mt-[29.5px] px-[32px]',
          children: [
            if (sale != null)
              _CollectionCard(
                image: DesignImages.of(sale.id, sale.imageUrl),
                height: 141,
                textClassName: 'top-[20px] left-[23px]',
                children: [
                  CollectionLabel(sale.label),
                  WDiv(
                    className: 'w-[90px]',
                    child: WText(
                      sale.title,
                      className: 'mt-[23px] text-[19px] font-light leading-[24px] text-dusk',
                    ),
                  ),
                ],
              ),
            if (summer != null)
              WDiv(
                className: 'mt-[15px]',
                child: _CollectionCard(
                  image: DesignImages.of(summer.id, summer.imageUrl),
                  height: 210,
                  textClassName: 'top-[32.5px] left-[23px]',
                  children: [
                    CollectionLabel(summer.label),
                    WDiv(
                      className: 'w-[100px]',
                      child: WText(
                        summer.title,
                        className: 'mt-[23px] text-[18px] font-bold leading-[30px] text-graphite',
                      ),
                    ),
                  ],
                ),
              ),
            WDiv(
              className: 'flex flex-row gap-[10px] mt-[16px]',
              children: [
                if (tShirts != null)
                  WDiv(
                    className: 'flex-148',
                    child: _CollectionCard(
                      image: DesignImages.of(tShirts.id, tShirts.imageUrl),
                      height: 194,
                      textClassName: 'top-[42px] left-[83px]',
                      children: [
                        WText(
                          tShirts.category,
                          className: 'text-[12.5px] text-steel',
                        ),
                        WDiv(
                          className: 'w-[60px]',
                          child: WText(
                            tShirts.title,
                            className: 'mt-[14px] text-[16px] font-light leading-[21px] text-ink',
                          ),
                        ),
                      ],
                    ),
                  ),
                if (dresses != null)
                  WDiv(
                    className: 'flex-154',
                    child: _CollectionCard(
                      image: DesignImages.of(dresses.id, dresses.imageUrl),
                      height: 194,
                      textClassName: 'top-[39.5px] left-[8px]',
                      children: [
                        WText(
                          dresses.category,
                          className: 'text-[12.5px] text-steel',
                        ),
                        WDiv(
                          className: 'w-[80px]',
                          child: WText(
                            dresses.title,
                            className: 'mt-[18px] text-[16.5px] font-light leading-[22px] text-ink',
                          ),
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

/// Card cu fundal gri deschis, poza in dreapta/stanga si text suprapus.
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
        AppImage(image, height: height),
        WDiv(
          className: 'absolute $textClassName flex flex-col items-start',
          children: children,
        ),
      ],
    );
  }
}
