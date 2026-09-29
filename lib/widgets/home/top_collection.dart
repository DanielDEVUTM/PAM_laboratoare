import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import 'collection_label.dart';
import 'section_header.dart';

class TopCollection extends StatelessWidget {
  const TopCollection({super.key});

  @override
  Widget build(BuildContext context) {
    return const WDiv(
      className: 'flex flex-col items-stretch',
      children: [
        SectionHeader(title: 'Top Collection'),
        WDiv(
          className: 'flex flex-col items-stretch mt-[29.5px] px-[32px]',
          children: [
            _CollectionCard(
              image: 'assets/images/collection_1.jpg',
              height: 141,
              textClassName: 'top-[20px] left-[23px]',
              children: [
                CollectionLabel('Sale up to 40%'),
                WText(
                  'FOR SLIM\n& BEAUTY',
                  className:
                      'mt-[23px] text-[19px] font-light leading-[24px] text-dusk',
                ),
              ],
            ),
            WDiv(
              className: 'mt-[15px]',
              child: _CollectionCard(
                image: 'assets/images/collection_2.jpg',
                height: 210,
                textClassName: 'top-[32.5px] left-[23px]',
                children: [
                  CollectionLabel('Summer Collection 2021'),
                  WText(
                    'Most sexy\n& fabulous\ndesign',
                    className:
                        'mt-[23px] text-[18px] font-bold leading-[30px] text-graphite',
                  ),
                ],
              ),
            ),
            WDiv(
              className: 'flex flex-row gap-[10px] mt-[16px]',
              children: [
                WDiv(
                  className: 'flex-148',
                  child: _CollectionCard(
                    image: 'assets/images/collection_3.jpg',
                    height: 194,
                    textClassName: 'top-[42px] left-[83px]',
                    children: [
                      WText('T-Shirts', className: 'text-[12.5px] text-steel'),
                      WText(
                        'The\nOffice\nLife',
                        className:
                            'mt-[14px] text-[16px] font-light leading-[21px] text-ink',
                      ),
                    ],
                  ),
                ),
                WDiv(
                  className: 'flex-154',
                  child: _CollectionCard(
                    image: 'assets/images/collection_4.jpg',
                    height: 194,
                    textClassName: 'top-[39.5px] left-[8px]',
                    children: [
                      WText('Dresses', className: 'text-[12.5px] text-steel'),
                      WText(
                        'Elegant\nDesign',
                        className:
                            'mt-[18px] text-[16.5px] font-light leading-[22px] text-ink',
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
        WImage(src: 'asset://$image', className: 'w-full $h object-cover'),
        WDiv(
          className: 'absolute $textClassName flex flex-col items-start',
          children: children,
        ),
      ],
    );
  }
}
