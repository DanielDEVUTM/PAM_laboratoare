import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../models/home_content.dart';
import '../common/app_image.dart';
import '../page_dots.dart';

class BannerCarousel extends StatefulWidget {
  final HeroBanner banner;

  const BannerCarousel({super.key, required this.banner});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  late final PageController _controller = PageController(
    initialPage: widget.banner.activeSlide,
  );
  late int _current = widget.banner.activeSlide;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = widget.banner.slides < 1 ? 1 : widget.banner.slides;

    return WDiv(
      className: 'px-[32px]',
      child: WDiv(
        className: 'relative h-[168px] rounded-xl overflow-hidden',
        children: [
          PageView.builder(
            controller: _controller,
            itemCount: pages,
            onPageChanged: (index) => setState(() => _current = index),
            itemBuilder: (context, index) => _BannerPage(banner: widget.banner),
          ),
          if (pages > 1)
            WDiv(
              className: 'absolute bottom-[9px] left-0 right-0',
              child: PageDots(count: pages, current: _current),
            ),
        ],
      ),
    );
  }
}

class _BannerPage extends StatelessWidget {
  final HeroBanner banner;

  const _BannerPage({required this.banner});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'relative w-full h-[168px]',
      children: [
        AppImage(banner.imageUrl, height: 168),
        // Umbra din dreapta, ca titlul alb sa se citeasca pe orice poza.
        const WDiv(
          className: 'absolute top-0 bottom-0 left-0 right-0',
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0x00000000), Color(0x80000000)],
              ),
            ),
            child: SizedBox.expand(),
          ),
        ),
        WDiv(
          className: 'absolute top-[18px] left-[150px] right-[20px]',
          child: WText(
            banner.title,
            className: 'text-[22.5px] font-bold leading-[31px] text-white',
          ),
        ),
      ],
    );
  }
}
