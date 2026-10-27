import 'package:flutter/material.dart';
import 'package:fluttersdk_wind/fluttersdk_wind.dart';

import '../../data/design_images.dart';
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

  int get _pages => widget.banner.slides < 1 ? 1 : widget.banner.slides;

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
            itemBuilder: (context, index) => _BannerPage(banner: widget.banner),
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
  final HeroBanner banner;

  const _BannerPage({required this.banner});

  @override
  Widget build(BuildContext context) {
    return WDiv(
      className: 'relative w-full h-[168px]',
      children: [
        AppImage(DesignImages.of(banner.id, banner.imageUrl), height: 168),
        WText(
          banner.title,
          className: 'absolute top-[18px] left-[188px] w-[125px] text-[22.5px] font-bold leading-[31px] text-white',
        ),
      ],
    );
  }
}
