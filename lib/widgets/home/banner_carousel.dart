import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../page_dots.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  static const int _pages = 3;

  final PageController _controller = PageController();
  int _current = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'px-[32px]',
      child: WDiv(
        className: 'relative h-[168px] rounded-xl overflow-hidden',
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: _pages,
            onPageChanged: (index) => setState(() => _current = index),
            itemBuilder: (context, index) => const _BannerPage(),
          ),
          WDiv(
            className: 'absolute bottom-[9px] left-0 right-0',
            child: PageDots(count: _pages, current: _current),
          ),
        ],
      ),
    );
  }
}

class _BannerPage extends StatelessWidget {
  const _BannerPage();

  @override
  Widget build(BuildContext context) {
    return const WDiv(
      className: 'relative w-full h-[168px]',
      children: [
        WImage(
          src: 'asset://assets/images/banner.jpg',
          className: 'w-full h-[168px] object-cover',
        ),
        WText(
          'Autumn\nCollection\n2021',
          className:
              'absolute top-[18px] left-[188px] text-[22.5px] font-bold leading-[31px] text-white',
        ),
      ],
    );
  }
}
