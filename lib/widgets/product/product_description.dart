import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

class ProductDescription extends StatelessWidget {
  final String text;

  const ProductDescription({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    TextStyle style(String className) =>
        WindParser.parse(className, context).toTextStyle();

    return WDiv(
      className: 'pt-[20px] pl-[2px] pb-[26px]',
      child: Text.rich(
        TextSpan(
          text: '$text   ',
          style: style('font-body font-light text-[11.6px] leading-[20px] text-ink'),
          children: [
            TextSpan(
              text: 'Read more',
              style: style(
                'font-body font-light text-[11.6px] leading-[20px] text-sage underline decoration-sage',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
